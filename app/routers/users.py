"""Exemplary module for the router responsible for user-related requests."""

from fastapi import APIRouter

router = APIRouter()


@router.get("/users/", tags=["users"])
async def read_users():
    """Get available users."""
    return [{"username": "FooBar"}, {"username": "Foo-Bar"}]


@router.get("/users/me", tags=["users"])
async def read_user_me():
    "Get own user."
    return {"username": "fake-current-user"}


@router.get("/users/{username}", tags=["users"])
async def read_user(username: str):
    "Get specific user."
    return {"username": username}
