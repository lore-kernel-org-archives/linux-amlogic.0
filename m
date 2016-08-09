From: grygorii.strashko@ti.com (Grygorii Strashko)
Date: Tue, 9 Aug 2016 14:47:03 +0300
Subject: [PATCH] i2c: don't print error when adding adapter fails
In-Reply-To: <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
References: <1470742581-12971-1-git-send-email-wsa-dev@sang-engineering.com>
 <1470742581-12971-2-git-send-email-wsa-dev@sang-engineering.com>
Message-ID: <e4e906fe-1362-1199-de42-a16b58800de6@ti.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 08/09/2016 02:36 PM, Wolfram Sang wrote:
> The core will do this for us now.
>
> Signed-off-by: Wolfram Sang <wsa-dev@sang-engineering.com>
> ---

For:
>  drivers/i2c/busses/i2c-davinci.c        | 4 +---
>  drivers/i2c/busses/i2c-omap.c           | 4 +---

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>


-- 
regards,
-grygorii
