From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Wed, 10 Aug 2016 10:32:00 +0200
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <35fd8f31-2fa1-7220-8ed9-13bad638fe6f@samsung.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/09/2016 01:36 PM, Wolfram Sang wrote:
> The core will do this for us now.
> 
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---

(...)

>  drivers/i2c/busses/i2c-exynos5.c        | 4 +---
>  drivers/i2c/busses/i2c-s3c2410.c        | 1 -

For Exynos and S3C2410:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
