FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
RUN apt-get install -y nodejs
RUN apt-get update && apt-get install -y build-essential

COPY . /mod8

WORKDIR /mod8

RUN dotnet build

WORKDIR /mod8/DotnetTemplate.Web

RUN npm install
RUN npm run build

ENTRYPOINT ["dotnet", "run"]
