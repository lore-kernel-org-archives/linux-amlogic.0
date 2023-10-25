Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0CBC0032E
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Oct 2023 10:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTdVJL3Tr/QRfNDoNc08nfnw8YS5k9cU8FNQBBDQ4ng=; b=cupCfEvWo/Ewqw
	DHyXEie7BPXMzcgYvE3DKA0zpIedPpoMMEofadDmasNPFOk3kfglyGzqP0R3ccwgo1C/yBoeB8QEL
	T+EKOOANkuM4TKuVie0i6KJxQOrdu99KQ3NFiRrNS1OSrPs+15CyaO+Gce3qjRbl7R+aWHnRgxI8C
	OzmRfjLDY0D/LNH013Jz6q7I/VXg7Jpbfk9mPsFfBPuRhWku3C15agS/TIS+cVLluoV9wRWKHWX2G
	IfiotSaiZsq2rebXy6UPQf3mFlPhZDsZKwkNWm5MRRQpGYBKqvabTteahhYELrvSQ7Ohb+7j0NfF2
	Nwm7EPGwlpXvT+7JxQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvawV-00Bvx8-19;
	Wed, 25 Oct 2023 10:16:51 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvawR-00BvqO-2u;
	Wed, 25 Oct 2023 10:16:49 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qvawH-0002cu-Ry; Wed, 25 Oct 2023 12:16:37 +0200
Message-ID: <bf6332bc-a6a6-4702-821f-69f2e890fda9@leemhuis.info>
Date: Wed, 25 Oct 2023 12:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mmc: meson-mx-sdhc: Fix initialization frozen issue
Content-Language: en-US, de-DE
To: Ulf Hansson <ulf.hansson@linaro.org>, Ziyang Huang <hzyitc@outlook.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, yinxin_1989@aliyun.com,
 briannorris@chromium.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <TYZPR01MB5556B56D834E02F41C44D81DC95FA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556A3E71554A2EC08597EA4C9CDA@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <CAPDyKFrLUf+dcZbPtXFncu_KO_SgzKSN1KCW8ds4=OUGpT8+Gg@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <CAPDyKFrLUf+dcZbPtXFncu_KO_SgzKSN1KCW8ds4=OUGpT8+Gg@mail.gmail.com>
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698229008;54c0b671;
X-HE-SMSGID: 1qvawH-0002cu-Ry
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_031648_157068_8CA0E6CD 
X-CRM114-Status: GOOD (  19.35  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 23.10.23 13:14, Ulf Hansson wrote:
> On Tue, 10 Oct 2023 at 18:44, Ziyang Huang <hzyitc@outlook.com> wrote:
>>
>> Commit 4bc31edebde5 ("mmc: core: Set HS clock speed before sending
>> HS CMD13") set HS clock (52MHz) before switching to HS mode. For this
>> freq, FCLK_DIV5 will be selected and div value is 10 (reg value is 9).
>> Then we set rx_clk_phase to 11 or 15 which is out of range and make
>> hardware frozen. After we send command request, no irq will be
>> interrupted and the mmc driver will keep to wait for request finished,
>> even durning rebooting.
>>
>> So let's set it to Phase 90 which should work in most cases. Then let
>> meson_mx_sdhc_execute_tuning() to find the accurate value for data
>> transfer.
>>
>> If this doesn't work, maybe need to define a factor in dts.
>>
>> Fixes: e4bf1b0970ef ("mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host")
>> Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
> 
> I have re-added Thorsten to see if he has some time to test this on his end.

FWIW, I was only involved wrt to regression tracking. It iirc was was
Martin that had reported the problem here:
https://lore.kernel.org/all/CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com/

Side note: a proper Reported-by: tag together with a Link or Closes tag
would be good to have in the patch descriptions, as explained in the Docs.

Ciao, Thorsten

>> ---
>> Changes since v1:
>>   Use Phase 90 instand of value 1
>>
>>  drivers/mmc/host/meson-mx-sdhc-mmc.c | 26 +++++---------------------
>>  1 file changed, 5 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/mmc/host/meson-mx-sdhc-mmc.c b/drivers/mmc/host/meson-mx-sdhc-mmc.c
>> index 97168cdfa8e9..29698fceb89c 100644
>> --- a/drivers/mmc/host/meson-mx-sdhc-mmc.c
>> +++ b/drivers/mmc/host/meson-mx-sdhc-mmc.c
>> @@ -269,7 +269,7 @@ static int meson_mx_sdhc_enable_clks(struct mmc_host *mmc)
>>  static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>>  {
>>         struct meson_mx_sdhc_host *host = mmc_priv(mmc);
>> -       u32 rx_clk_phase;
>> +       u32 val, rx_clk_phase;
>>         int ret;
>>
>>         meson_mx_sdhc_disable_clks(mmc);
>> @@ -290,27 +290,11 @@ static int meson_mx_sdhc_set_clk(struct mmc_host *mmc, struct mmc_ios *ios)
>>                 mmc->actual_clock = clk_get_rate(host->sd_clk);
>>
>>                 /*
>> -                * according to Amlogic the following latching points are
>> -                * selected with empirical values, there is no (known) formula
>> -                * to calculate these.
>> +                * Phase 90 should work in most cases. For data transmission,
>> +                * meson_mx_sdhc_execute_tuning() will find a accurate value
>>                  */
>> -               if (mmc->actual_clock > 100000000) {
>> -                       rx_clk_phase = 1;
>> -               } else if (mmc->actual_clock > 45000000) {
>> -                       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_330)
>> -                               rx_clk_phase = 15;
>> -                       else
>> -                               rx_clk_phase = 11;
>> -               } else if (mmc->actual_clock >= 25000000) {
>> -                       rx_clk_phase = 15;
>> -               } else if (mmc->actual_clock > 5000000) {
>> -                       rx_clk_phase = 23;
>> -               } else if (mmc->actual_clock > 1000000) {
>> -                       rx_clk_phase = 55;
>> -               } else {
>> -                       rx_clk_phase = 1061;
>> -               }
>> -
>> +               regmap_read(host->regmap, MESON_SDHC_CLKC, &val);
>> +               rx_clk_phase = FIELD_GET(MESON_SDHC_CLKC_CLK_DIV, val) / 4;
>>                 regmap_update_bits(host->regmap, MESON_SDHC_CLK2,
>>                                    MESON_SDHC_CLK2_RX_CLK_PHASE,
>>                                    FIELD_PREP(MESON_SDHC_CLK2_RX_CLK_PHASE,
>> --
>> 2.34.1
>>
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
