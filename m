Return-Path: <SRS0=oj2F=KX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40E9C4708C
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 08:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2B460E08
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 May 2021 08:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2B460E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwIRcAsavLBGTBFZ9VFtp8UHHu1d2qJHAXbOjIxs9Zw=; b=d/42VrCiwFmkqf
	rSmOPyThJy7pLEkqXoFo7dekEokFyijphtaX3Zvs1JOJ6GgM5KcFCWq1SihnuwOKfd9xb/xiwk/II
	gXcgP0cXHtJYz7gUxdQ0tMiRFcydy03MC3g56wCvhMV3WMsCSDQkTYJv9AtSuyeNVgQ+inNxJinwL
	8GKF1ttYtYmuQSBmTzspsi13AGXMaO7DpnHpNwgaQpUCGO3XC8Mp7WK91FBD0jfOO/9vxpWmLkM3f
	MB7pJIKsCXGCVQosimaCA8Oe3HmMT53n9rMVyWnjRvcXjPI6KejA1aGXcc9xnSVLK0TVnsF+PmPiZ
	Wt8uDum4ueqWfY194c2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmXkE-00DOPE-3y; Fri, 28 May 2021 08:21:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmXjj-00DOCU-AP
 for linux-amlogic@lists.infradead.org; Fri, 28 May 2021 08:20:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so4063705wmk.1
 for <linux-amlogic@lists.infradead.org>; Fri, 28 May 2021 01:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EoggRuztRaQb06EHbjm5w3ArdngW4v/4mBdTsb5ErtQ=;
 b=koocXNzabsa+z2FZjXCuOMKjhuLbFaZf1RMaPtHcyc1fETT2PbmvaL43QH00369ajd
 QgjBJVTG/df2YG7O7p6TkLNTOzgSEQIE784hPljU2rcguhdKqh4Ep2TsgsCVHe6c/Mam
 AaKZn0SyF/rxX8xVxO5j9dVaXFTR8tdeLuWPE//zpd7PSkF0oR9IJmr4q+zR8pd6xA6Q
 mOh0axHU+5CZvFr1ntNW57kbn0g0np6K/peiuA8mEZALfD+x0yyLvDrak8FGcGIoCKFc
 89kmbSEFnk6Wjb++wMFWX35GZRf78oQleY6Fn2Cm9+8D9+HWA41a0BiCPhNPST6IsBFG
 57XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EoggRuztRaQb06EHbjm5w3ArdngW4v/4mBdTsb5ErtQ=;
 b=W4LgFua+9JlOFPMlcGadNNGvkSg4uxxSvj42dFOGFdLyp/y6AGwNgM2C9GRu6j8cLt
 nPZ9MJ0t+vVXp2X+WQtSvleMbWQOoMVsP74yYblH95ehLpu58L649DiPUBPluU+qx8hV
 99SsTp5pMBdgfOcn9Ui2+1OwNfceyB9XSqldtKXZPBzNSFT+zV/QaBQH44RdX3z+NKAX
 p/DSsll2ZG1MR6vqw9sqndfTFQKhTqXwJATMSucUNxDBKarX2Q2RYzn8I51FR+wej6AQ
 Bs4u7kbmeZ1FdBaCYwRfjTWe7l746MDMhyMILw6lzT7g57eB+HBNUuY06N1cqpNmW0LA
 fhPw==
X-Gm-Message-State: AOAM530KDyK5HcQXOnJU7aqF+/SL/wZIUAJCkJF7tKrnKSwbM3Np/6Yy
 fHJ+ZdbsCpprv5cujMW+Lbpp9A==
X-Google-Smtp-Source: ABdhPJytUinbQud6bM2Ds2pPY24+kKqOPqnVudJSoC+UQpyMiZK/m4xWzouaOvkQE4EjS6/OgGbDoA==
X-Received: by 2002:a05:600c:244:: with SMTP id
 4mr12398190wmj.163.1622190052387; 
 Fri, 28 May 2021 01:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:668d:49f3:7f84:14a7])
 by smtp.gmail.com with ESMTPSA id
 j10sm6068985wrt.32.2021.05.28.01.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 01:20:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] arm64: meson-sm1: add support for Banana PI BPI-M5
Date: Fri, 28 May 2021 10:20:45 +0200
Message-Id: <162218886298.197461.17389630028036069974.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514143255.3352774-1-narmstrong@baylibre.com>
References: <20210514143255.3352774-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_012055_378803_CD24E768 
X-CRM114-Status: UNSURE (   9.38  )
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

On Fri, 14 May 2021 16:32:52 +0200, Neil Armstrong wrote:
> Banana Pi BPI-M5 is a credit card format SBC with the following features:
> - Amlogic S905X3 quad core Cortex-A55
> - Mali-G31 GPU
> - 4GB LPDDR4
> - 16GB eMMC flash
> - 4 USB 3.0
> - 1 GbE ethernet
> - HDMI output
> - 2x LEDS
> - SDCard
> - 2.5mm Jack with Stereo Audio + CVBS
> - Infrared Received
> - ADC Button
> - GPIO Button
> - 40 pins header + 3pins debug header
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: meson-sm1: add toacodec node
      commit: ddbdaa4d596396e3aa0d60a0ab023d19822a3682
[2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
      commit: c53ab8f96af1f1fcaa0c1bc851a7704ae4b413d2
[3/3] arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts
      commit: 976e920183e406726637db925efdf8b407a2d03a

Best regards,
-- 
Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
