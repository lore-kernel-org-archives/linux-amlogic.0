From: srinivas.kandagatla@linaro.org (Srinivas Kandagatla)
Date: Tue, 13 Nov 2018 09:06:19 +0000
Subject: [PATCH 4/4] nvmem: meson-efuse: add peripheral clock
In-Reply-To: <20181030102231.4851-5-jbrunet@baylibre.com>
References: <20181030102231.4851-1-jbrunet@baylibre.com>
 <20181030102231.4851-5-jbrunet@baylibre.com>
Message-ID: <256195a8-db8b-0945-090f-a63e5e665b15@linaro.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org



On 30/10/18 10:22, Jerome Brunet wrote:
> Get and enable the peripheral clock required by the efuse device.
> The driver has been handle to work without it so far because the
> clock was left enabled by default but it won't be the case soon.
> 
> Signed-off-by: Jerome Brunet<jbrunet@baylibre.com>
> ---
>   drivers/nvmem/meson-efuse.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Applied, thanks,

--
Srini
