Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0166ECAA2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Aug 2022 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y7YzDE4J3LDwzGPZunoVJ/6/9DxR5pyImDYtGNony3M=; b=QFTvlDyOVXWHo7
	6QHLFwLVN83gbgWkf1+Jm2ODknqD5KdFifhHdeH7A/atDbJoLavWLHnPU+JWTdilKd4lg1Qj2BwCi
	zQ0n2TLQL2FmrnoGN8Wjy4J1W0gonMD5zsS053jfGnGmu2M6G8zfFmfHUprrGRsGMSM8biHO4BfVW
	q8E/Pxf9OPI5o7DkFhtuVzYRYQ4HmE4kft2yErD3Ab7b933G/eXmXPYrzlJr66bNVvjx4maTSNKb9
	m/HwMSa5XOQ57IVDeSOIytsGLfF3DqOuiAx2ISNqbTMO2K8o8slB6ga2lqbvf2ScpIfHp7mwp91V4
	ne388t0XVY98ULikvOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIuZ-002spr-OO; Thu, 25 Aug 2022 19:53:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRIuN-002sju-9d; Thu, 25 Aug 2022 19:52:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b16so27478910edd.4;
        Thu, 25 Aug 2022 12:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=YZ/i2GUAQi2cQp6QrxSxxAPIHVo7GpOuEoWXlrwJRxY=;
        b=OpnTNk5d2dPsoFZnsZOT1TqDoRjrlgAZCStMnSYVsRUqyrBBiT2dzSepu6hGOojLnV
         eg6y6uXBcMCTEqCQt15zltzYoNiuCG2ECefqLnjoSm1pfkjx/WF/ebrJr0Xl1KETflDR
         3vwN4N3GCbx1Gyr6vglwN3KwaUBpilXbgN7+iLaONCFORrjz41nf4t0Bgk+HBr8FjEdY
         vGi4Tny5/9QzH7FBrSQ6fuQkaVjUFOddkXrS5QGltgKS/uQZu9M+gGiPq3G42XAKstPt
         +t2y91Yk6koVd9hIpcbRmUTkjR8TG8eKKG/SDSRy5RjqaOKRP98OGsi3PfFp8wMwjcs9
         MdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=YZ/i2GUAQi2cQp6QrxSxxAPIHVo7GpOuEoWXlrwJRxY=;
        b=DtViT5EroyTRkFoEsghwRqOYYqXjj+grJSSSE+SJswY/LTHtj9ZS/omce9I0ei8nfw
         WDoKfkdj6L8xLTizeaqtUWD8Koa19acLBIqiJktiGCEglHpIvNUdtEgBjPbxT0jHxfJy
         7YaySD6yZMFhpzIW9QrykxOfyA5vVumWWrFR+pbYeHpB66BvQRrZ5bbdRLa7iGC5VMZk
         7AajkGualmyQOPtQVNw/F+404/fU9ieVJNBx9P+CLyTc2SYe/u1vVHrithT5VPN3Og06
         fsWVLDtscy1eGjHJ9aRjlE4ac9ZaUrUDgIYO1AoLULHiBL5D9rRvqUulrIXVJ8OPbCzu
         MvsA==
X-Gm-Message-State: ACgBeo3RNnqlBtPuSnHcsB/ovz8F2MStTnASp0CKJ6x1fHPtYx4kUzad
	Onn2AMLPVy3n0TyuGCYtxfg=
X-Google-Smtp-Source: AA6agR6tuGauKOsJtiyebBmulfuqN52pYGFT+djQK1Yv/m4LtmSjaFjTL6JXKp90u8V9lkuKrEJ0sg==
X-Received: by 2002:a05:6402:3711:b0:445:e264:beed with SMTP id ek17-20020a056402371100b00445e264beedmr4408738edb.136.1661457172856;
        Thu, 25 Aug 2022 12:52:52 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72a6:5f00:b844:7c7d:e964:bb65? (dynamic-2a01-0c22-72a6-5f00-b844-7c7d-e964-bb65.c22.pool.telefonica.de. [2a01:c22:72a6:5f00:b844:7c7d:e964:bb65])
        by smtp.googlemail.com with ESMTPSA id p17-20020a50cd91000000b004479cec6496sm170461edi.75.2022.08.25.12.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 12:52:52 -0700 (PDT)
Message-ID: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
Date: Thu, 25 Aug 2022 21:52:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_125255_399782_977B95A5 
X-CRM114-Status: UNSURE (   4.73  )
X-CRM114-Notice: Please train this message.
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

Add SDIO interrupt support. Successfully tested on a S905X4-based
system (V3 register layout) with a BRCM4334 SDIO wifi module
(brcmfmac driver).

v2:
- use new SDIO interrupt API
v3:
- don't duplicate checking mmc->sdio_irq_pending

Heiner Kallweit (2):
  mmc: meson: adjust and re-use constant IRQ_EN_MASK
  mmc: meson-gx: add SDIO interrupt support

 drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 19 deletions(-)

-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
