Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0E0C636D4
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2u5lE3F8JIqmNPBuCP/1IwWc9ML72AxJGn/EiKBxQQ=; b=HRPBDw36/cz6Mn
	Rq4bH1snW8qc/JtM4/MIpDh/P0COv0HEAk6w1R3W7vb1uzBgh1yZF1UqjtxZDDQrPd34kvmmnNZS6
	0pA3hmM4/ps+R4v+E0xjj0ab7DBQw2JkQqhEpq7l+1v7E629ARLO7Tua4bgWMjXxA+yxqVf1mPb5P
	KdfIgTYVjzlFxWSwauud3gQxO+s9FSKPQqsxQOEqcBe/iNm4WifdzI4VbBTdyDZEpmkOEQa61Ai/U
	ZEF7mA7Lj0/h6vv+9PAj9QGpqf2fET9jIDEKQKKnx/n/5HBDznwjxIAvKbDEfrDtmWAoYPTCby1dY
	vSgsfaVzPQycxsxmkHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJ8-00DSw8-JR; Wed, 01 Feb 2023 20:02:14 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJJ5-00DSuy-Pn; Wed, 01 Feb 2023 20:02:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id qw12so38839752ejc.2;
        Wed, 01 Feb 2023 12:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwxNJxFlwiJY3LE0c9a6Ul2PZq/gNO1u4vk0lo6jnI=;
        b=IVLey1eKZEphphuNftYbmy7S1jjoJUqk4PgJK0jUbbm3gYEPerkSIQdBo2Ny1fXClI
         8neWXXxDRn28q63pPFRneXPzJESFwzBwlzruwVrq1YUdsb5eUKUKSf57XNWn1ZHqzSpw
         +jkd0YvzOOSX0mkuh0zlp+GSB5ynYsvE/fg2804Dpdr0nbEiGLNdDYEAXlLOyN0tlztr
         RS6KDUeR33/bPOMblHolVz2eEaLWKVx0BWlpYa79LKGh0nIQfkxG4k8uvaLgfG9TCaJ6
         Nmt495Lta0Vj6MHnKSU0yntoSFGhW5EyM5JuWpBLtKzy+4g667VYsilKsR9DNSDGAGN3
         WSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUwxNJxFlwiJY3LE0c9a6Ul2PZq/gNO1u4vk0lo6jnI=;
        b=jKTUk2Bofp/M1Hy5sNpDJIFONEYFWv0lG3TB3vT7eF3Up2KSc8KNsi8Nv09eDz1VcO
         t/X8/hXi6jHY6ZptDpV3S26LrYDfDvGDMCmv+NoVq8mIzA9POQYPEo1qtSCbEA/b5jIj
         u9mdN6Zpg/n/+HsZBXin8TVnU+aQmFV/E21RX/frV8VLH3l7IcEPfZRRBNIA+kqIoLaK
         dIYTOn9pQnWhFD0KlByum7TfAai/Xii+pydU8SQRwj+cC+5xLvzqymNPg1FLVKUj8kBq
         wl4NGkmgAA1y38+n8xZngv0b1ysDra3oyaJ4OcTyE02plxJjpIj25R5NleSp+23OPqim
         +t9A==
X-Gm-Message-State: AO0yUKUh2qD+s3fzoTBoG43ZkgYXkB1oz2NI4ewO980f7pawsEOXEjDP
	HwmLb3Uezaa5KvMZIqhXNa4=
X-Google-Smtp-Source: AK7set8h0j6vw0PIPChjn+OwS6+zd1oGxPsJJFo8VoSYCJEhnxWEj0LExbaxskt85Q397EyTALNABw==
X-Received: by 2002:a17:907:1607:b0:87b:6aa1:c87f with SMTP id hb7-20020a170907160700b0087b6aa1c87fmr4814168ejc.26.1675281730131;
        Wed, 01 Feb 2023 12:02:10 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id se11-20020a170906ce4b00b0087f68a2681bsm8264924ejb.96.2023.02.01.12.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 12:02:09 -0800 (PST)
Message-ID: <66f77c32-2678-3e31-fb00-1294ccaa6045@gmail.com>
Date: Wed, 1 Feb 2023 20:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: [PATCH 1/4] arm: dts: meson: adjust order of some compatibles
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
In-Reply-To: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_120211_880706_B8F13C74 
X-CRM114-Status: GOOD (  11.83  )
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

During review of a new yaml binding, affecting these dts, it turned out
that some compatibles aren't ordered as they should be. Order should be
most specific to least specific.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d5a3fe21e..5979209fe 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -580,8 +580,8 @@ &ethmac {
 };
 
 &gpio_intc {
-	compatible = "amlogic,meson-gpio-intc",
-		     "amlogic,meson8b-gpio-intc";
+	compatible = "amlogic,meson8b-gpio-intc",
+		     "amlogic,meson-gpio-intc";
 	status = "okay";
 };
 
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
