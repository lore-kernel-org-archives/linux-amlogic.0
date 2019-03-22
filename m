Return-Path: <SRS0=ykIO=RZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0DDC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 22:53:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1F121841
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Mar 2019 22:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZBwK9dIE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WAMPAopH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1F121841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CRbGzK0k7FlvElqt63QRzPe1A28CPaOJyRZoqcN9EMs=; b=ZBwK9dIEdRx5cT
	PbYKzRek7Fvs/F/g/UbCqhVgGOMEO7LjcHV4hYLEZ0HOZO7qbSjQYC5maAL9wmc3+TBoMlSfwUjVP
	iYBGGvjcOcHBZ/rcntSLdB0dntyyFI3vmqk6SBMYOoVZJgmcAyIoWYqw1AOVrRFacBoPtN2hpCSja
	rMnmVsWZJDOMEJiXK2X4r8WyuBa9AZ0CiQdH+RjT0HINOZOIJMRMKFa7qtnBaAmgglunCCv/3gZ1Y
	12baKt+6J/xX4SLTb8khFpVCpSQUgukgFWV3OdW5N+PKsxaYI3O8Komja+SVY0oz33ltSg9+5EeuS
	FxspMyEFtihJRKOK1wwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7T2u-0005v2-1I; Fri, 22 Mar 2019 22:53:52 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7T2l-0005nb-FF
 for linux-amlogic@lists.infradead.org; Fri, 22 Mar 2019 22:53:45 +0000
Received: by mail-pg1-x544.google.com with SMTP id k11so2453593pgb.8
 for <linux-amlogic@lists.infradead.org>; Fri, 22 Mar 2019 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=GncCQtYcc5p/mQeESC8imClqO96q5DmCNZNjKyO90V0=;
 b=WAMPAopH9DFo9aKieKcMIN8LiO2W2ahOoKivCdJYcM+ggw16+LJZ00FqWasHGO3v06
 mzU1Wvu1SvUVuCWY+Tk9m1h3pj3Nvk2UEZyXnRmwNolybffS1otEcZdK3Y8AhKxlpDH6
 y1awnnF4UwsnN5J0mWQmRLioqqoWQp1d5ozpySjZVIpS1RYuN8+cwJ0w/XvtPcV5H9Zg
 0+9agMpzGonsWc8tu0+f71tYKF5/5v/VV+3eFfWf+8LULpQ8bq6AX1wB/7QzRanmXqou
 wud83sCBbdUpUXrff+8wFFg1GzY6rEr2fcUXtOdwFSl3Swlub4HTjqX786QWdOofKVX3
 x0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=GncCQtYcc5p/mQeESC8imClqO96q5DmCNZNjKyO90V0=;
 b=nVp7vOZv5eJ5r6QvHGr37XgPLdPueQjvYHkxkKXfoJYi26grY4mP1GtfQRA2gXcQkU
 owblZboLIR8gI3Sot+2o3ExWcjS7Fu9IYYeB4/pCnH7h+hH7GKC8ZTiVufooxXNdYSDa
 oKafu4tJvuEPnjuPd+XgY0GQvsazqr389PiaefxzgdhxcEqrhQjWEpFScbQhKk+4+y0+
 xbMvQs6fllMcr78r5UUbrT4gdfPcHqovEVf1UEYeepQ6gNNA6s4g1qL3OV6bOhrV60Wt
 dL8pp9uH2bZbxuUJBPhckO6phqsMh3kDfnwPxubIFwIK13eoAEao0HST8glI81YbNCKh
 UV5g==
X-Gm-Message-State: APjAAAUD6SBIoesvSNSNBsHQgxm1ZgZyH2PDA7q9Avdi5IysZDJKUsXX
 bvo4Ob6k+I030wtJcUtCNHBZrQ==
X-Google-Smtp-Source: APXvYqyXNvTIfknnWkTEBq9VXhyBMnGstcX4kOkMOvcVuWkrGmqRtQ8+ooHUHbVqlr9zQGvbMgTxVw==
X-Received: by 2002:a63:4718:: with SMTP id u24mr11434186pga.381.1553295222193; 
 Fri, 22 Mar 2019 15:53:42 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6963:3508:5454:eecd])
 by smtp.googlemail.com with ESMTPSA id
 x19sm11365757pfm.108.2019.03.22.15.53.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Mar 2019 15:53:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
In-Reply-To: <1553078122.7071.6.camel@pengutronix.de>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
 <1553078122.7071.6.camel@pengutronix.de>
Date: Fri, 22 Mar 2019 15:53:40 -0700
Message-ID: <7hbm2234i3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_155343_564422_882274B2 
X-CRM114-Status: GOOD (  10.46  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Philip,

Philipp Zabel <p.zabel@pengutronix.de> writes:

> On Mon, 2019-03-04 at 11:49 +0100, Neil Armstrong wrote:
>> The G12A Documentation lacked these 2 reset lines, but they are present and
>> used for each USB 2 PHYs.
>> 
>> Add them to the dt-bindings for the upcoming USB support.
>> 
>> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> index 8063e8314eef..6d487c5eba2c 100644
>> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> @@ -51,7 +51,10 @@
>>  #define RESET_SD_EMMC_A			44
>>  #define RESET_SD_EMMC_B			45
>>  #define RESET_SD_EMMC_C			46
>> -/*					47-60 */
>> +/*					47	*/
>> +#define RESET_USB_PHY20			48
>> +#define RESET_USB_PHY21			49
>> +/*					50-60	*/
>>  #define RESET_AUDIO_CODEC		61
>>  /*					62-63	*/
>>  /*	RESET2					*/
>
> Thank you, applied to reset/fixes with Martin's review tag.

Could ou make a immtable tag for this in your tree?  This is needed for
some upcoming DT users we'd like to queue for the next cycle.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
