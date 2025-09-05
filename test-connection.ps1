# Test Connection Script for ML Cogni
# This script tests the connection between frontend and backend

Write-Host "🔍 Testing ML Cogni Connection..." -ForegroundColor Cyan
Write-Host ""

# Test Backend Health
Write-Host "📡 Testing Backend Health..." -ForegroundColor Yellow
try {
    $healthResponse = Invoke-WebRequest -Uri "http://localhost:8000/health" -Method GET -TimeoutSec 10
    if ($healthResponse.StatusCode -eq 200) {
        $healthData = $healthResponse.Content | ConvertFrom-Json
        Write-Host "✅ Backend is healthy!" -ForegroundColor Green
        Write-Host "   Status: $($healthData.status)" -ForegroundColor Green
        Write-Host "   Models Loaded: $($healthData.models_loaded)" -ForegroundColor Green
        Write-Host "   Database: $($healthData.database_status)" -ForegroundColor Green
        Write-Host "   CIBIL Records: $($healthData.cibil_records)" -ForegroundColor Green
    } else {
        Write-Host "❌ Backend health check failed with status: $($healthResponse.StatusCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Backend is not accessible: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   Make sure the backend is running on port 8000" -ForegroundColor Red
}

Write-Host ""

# Test Frontend
Write-Host "🌐 Testing Frontend..." -ForegroundColor Yellow
try {
    $frontendResponse = Invoke-WebRequest -Uri "http://localhost:3000" -Method GET -TimeoutSec 10
    if ($frontendResponse.StatusCode -eq 200) {
        Write-Host "✅ Frontend is accessible!" -ForegroundColor Green
        Write-Host "   Status: $($frontendResponse.StatusCode)" -ForegroundColor Green
    } else {
        Write-Host "❌ Frontend check failed with status: $($frontendResponse.StatusCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Frontend is not accessible: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "   Make sure the frontend is running on port 3000" -ForegroundColor Red
}

Write-Host ""

# Test API Endpoint
Write-Host "🔌 Testing API Endpoint..." -ForegroundColor Yellow
try {
    $testBody = @{
        age = 30
        gender = "Male"
        marital_status = "Single"
        property_type = "Owned"
        education = "Graduate"
        employment = "Salaried"
        experience = 6
        salary = 50000
        cibil_id = "ID_001"
    } | ConvertTo-Json

    $apiResponse = Invoke-WebRequest -Uri "http://localhost:8000/predict" -Method POST -Body $testBody -ContentType "application/json" -TimeoutSec 15
    if ($apiResponse.StatusCode -eq 200) {
        Write-Host "✅ API endpoint is working!" -ForegroundColor Green
        $apiData = $apiResponse.Content | ConvertFrom-Json
        Write-Host "   Eligibility: $($apiData.eligibility_status)" -ForegroundColor Green
        Write-Host "   Product: $($apiData.recommended_product_type)" -ForegroundColor Green
    } else {
        Write-Host "❌ API endpoint failed with status: $($apiResponse.StatusCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ API endpoint test failed: $($_.Exception.Message)" -ForegroundColor Red
}

Write-Host ""
Write-Host "🎯 Connection Test Complete!" -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 If you see errors:" -ForegroundColor Yellow
Write-Host "   1. Make sure both services are running" -ForegroundColor Yellow
Write-Host "   2. Check if ports 8000 and 3000 are available" -ForegroundColor Yellow
Write-Host "   3. Verify all required files are present in backend/" -ForegroundColor Yellow
Write-Host "   4. Check the deployment guide in DEPLOYMENT.md" -ForegroundColor Yellow
