From: srinivas.kandagatla@linaro.org (Srinivas Kandagatla)
Date: Mon, 12 Nov 2018 13:08:57 +0000
Subject: [PATCH 1/4] nvmem: meson-efuse: add error message on user_max
 failure.
In-Reply-To: <20181030102231.4851-2-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-2-jbrunet@baylibre.com>
Message-ID: <419f8f2b-0677-a647-6f01-a1596f2a80cc@linaro.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 30/10/18 10:22, Jerome Brunet wrote:
> Add an explicit error message when SM_EFUSE_USER_MAX command fails
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/nvmem/meson-efuse.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Applied to nvmem for-next branch!

thanks,
srini
