Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B37C61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z+j1zNd+Nl5o1eAhMAkxBHN1qY33yeD55+amrVh8zcM=; b=SJrKVjrrE4PLt9
	oPdWGN9NwkenLMfMkitbZEEd5hjqswzYl00XfcI2y+iOz9bEa/J2OeTdlYPPE4jc+d/u80lSNt7pb
	TTlAkbqHF9Gm5i/VpWUSjzyT8/WAnsWc3IO3lkxK2+8GLaneCP/DLRaOmdhqdobcXcpqUEiBBs6+/
	3gRE4oj9R3xg/m80KeiQTtiRNFGT7wujV75/3B5Mt7K4FMQagOwnnNmGUCVIAY6I9yALjHmSqM/7O
	k689CorTNcS5AiAr/RMoxInxDanEjYuerBexOW74pLJOcxGeYlGT9E1ekrXsNvweYmzeIeQ5rG1Bn
	LTjBKNOkbLqV7c6eGaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDKI-0092WX-Gl; Thu, 09 Mar 2023 10:16:46 +0000
Received: from smtp2-g21.free.fr ([212.27.42.2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDKF-0092Vd-Al
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 10:16:44 +0000
Received: from [192.168.108.81] (unknown [213.36.7.13])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3DFD72003D0;
	Thu,  9 Mar 2023 11:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678357001;
	bh=KsY0ROkL+cUe7OoIP278GJcGrIgfnvguP7NW7TiJfnY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=faXhcrfJzqMhRwEuDizNUVJi8EeUdU3GMRzmg+yYvq2RjxMWl6XYwcDMjARU25yBF
	 LvPL/LH368oeEV6NO25PdC0w47cd1GVxf8pjWgseCWJM1yIs43nhQ/Sn+kPM6vAXyw
	 921VJHuDlQCSfLYkC/IzHz65t8BhNUcEDmOtFOkBhHjzG1q29/buIDF/3vlGdTY22K
	 RDgYaYf0WKD1zGlQSobHywgxUtZPKLxmsLkjVQbIq1+5rWvMuySbRYxYXvQ8uHX4Kq
	 ed0auBox94ef9PKjD3VSgALFZUqttVpkzYDFUeoYQ/CCWcA7JI42f9UwFFwlwniWnY
	 hkSJKQSycFH7A==
Message-ID: <13676dcc-944f-cf3d-8adf-ee3d4e8fa699@free.fr>
Date: Thu, 9 Mar 2023 11:16:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>
Cc: linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
In-Reply-To: <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_021643_541079_A2413F6D 
X-CRM114-Status: GOOD (  14.32  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06/03/2023 11:24, Marc Gonzalez wrote:

> # cat /sys/bus/sdio/devices/mmc2:0001:1/uevent
> OF_NAME=wifi
> OF_FULLNAME=/soc/sd@ffe03000/wifi@1
> OF_COMPATIBLE_0=brcm,bcm4329-fmac
> OF_COMPATIBLE_N=1
> SDIO_CLASS=00
> SDIO_ID=02D0:AAE7
> SDIO_REVISION=0.0
> MODALIAS=sdio:c00v02D0dAAE7
> 
> NB: 0xaae7 = 43751

I have run into another issue.

The WiFi device (and the mmc2 bus it sits on) don't show up at all
in the kernel log *unless* I add lots of debug output, such as with
#define DEBUG in drivers/base/dd.c

I think this points to some kind of race condition?

Neil suggested that maybe the host probes the mmc2 bus "too soon",
when the WiFi device is still powering up, which makes the entire
probe fail.

This patch appears to solve the symptom:

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 6e5ea0213b477..999b3843c0d0b 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1400,7 +1400,7 @@ static struct platform_driver meson_mmc_driver = {
 	.remove		= meson_mmc_remove,
 	.driver		= {
 		.name = DRIVER_NAME,
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 		.of_match_table = meson_mmc_of_match,
 	},
 };

But this might just be delaying the probe enough for the device
to become ready?

Ideas/Suggestions?

Regards


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
