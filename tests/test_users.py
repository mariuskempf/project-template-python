"""Unit tests for the users FastAPI router."""

from fastapi import FastAPI
from fastapi.testclient import TestClient

from app.routers import users

# Set up a test FastAPI app with the users router
app = FastAPI()
app.include_router(users.router)

client = TestClient(app)


def test_read_users():
    """Test the /users/ endpoint returns a list of users."""
    response = client.get("/users/")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
    assert {"username": "FooBar"} in response.json()


def test_read_user_me():
    """Test the /users/me endpoint returns the current user."""
    response = client.get("/users/me")
    assert response.status_code == 200
    assert response.json() == {"username": "fake-current-user"}


def test_read_user_specific():
    """Test the /users/{username} endpoint returns the given username."""
    username = "marius"
    response = client.get(f"/users/{username}")
    assert response.status_code == 200
    assert response.json() == {"username": username}
