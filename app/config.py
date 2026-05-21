from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    app_name: str = "SHARAY FastAPI Service"
    app_version: str = "0.1.0"
    environment: str = "local"

    model_config = SettingsConfigDict(env_prefix="SHARAY_", env_file=".env")


settings = Settings()
