Return-Path: <SRS0=1Oxc=QC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32432C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:02:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F191061BF9
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Nov 2021 10:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F191061BF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Bn40iOalE12zJxFwyIpEow40QWUpHLvXqu2Fazsg2g=; b=cirfjpvIKLylSx
	5h6KL0ZRBCJa3kS/VCDi7PodeAJxv3xsZOmO1GN4AQcIh/k1winu1ZS3I99zL9Gs8pBeIdFfhXJuQ
	5d4p4irTjp8IceW4UTKq9mUXmJ/9H9YNrcXa/BD1NAReQ45ArZlmKvKPxS+UjXoaINVIKDSov/vPM
	iT5i/hwEIN/wOMx6YNPI32dtrLu3t5M5pBiiyIJwGL1VaJ1vaC/R4WNinttNdI44XeHWYCy+za8iZ
	ZQmN3BceY7FL+D4N+GyqRuFp5zeAiOepfwcW2rc7IlBAPYtUHxxUddGt8lVVX3n6RVa1HAAhv/FPQ
	Bido+Tdu7OBdQa34WxVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYoj-00F44k-1U; Mon, 15 Nov 2021 10:02:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmYIa-00EvhK-4H
 for linux-amlogic@lists.infradead.org; Mon, 15 Nov 2021 09:29:19 +0000
Received: by mail-wr1-x430.google.com with SMTP id w29so29234392wra.12
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Nov 2021 01:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RKufxnEkGwvgDrdIXbzHHGgttZ8o4UlM8CnSVDJeTk=;
 b=u8dblw3+lpHAPpWi0ipUGv62e48JAFU3zYUcMhaIV1SOfuuG4SoQ5xrho8U2auArYF
 lbFVR/yY8o0+3OEOsByw+SQSqnlOCZsFswdoCuAjO8p2NDDw7S9l6xbAa77PXxMUSUrA
 FrLIV7k23OELyQIQYYib3YWEamzi4QFfj1bmgFeIoSMNcoQOkFEmjlIghgig4sUFnSgW
 6tO5DB/ye7RKa1PsKOIKEyEZYUsCa4vUCmPFEjwa2p6i2/JN7d2so9UiwmAWN6RcGRHJ
 HOIcuitriFGT67Caicyox7XZNYZwluO3EMjzo7WxESfawSvHoHaYTXhLZSGf53U58EcK
 vxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RKufxnEkGwvgDrdIXbzHHGgttZ8o4UlM8CnSVDJeTk=;
 b=u3u9WlLpJGG3iTt80v5Y1gGdE5XTaDK1CtBakqmqGDG6ZDyR6ODuaSEz5elkVdiwdm
 9mBg02XYpodGladovprvwoWo7Je9UihwjZq0c3hFB3QMS/JKIeD1FzZEdeN+fsisFRuP
 kWUUiMI6FHQdgLdg8GyuEhBgzD368riV9Lt/VXplc9dDB2hURZPtalQ7TNigyiNnBgnx
 QpwdtqmAuKU3fUbeC/9FZIN5Wvqt5+DSvR0r7VTmqgKXR6wB1meFAxyc7ZQkKn25k6YW
 Ow6ujks2pcvQyTNs0uXXLnrFPgycVoXvLav1661Xr+3FGJUkcXdToM/QiWzIpaShMg3Y
 1AUw==
X-Gm-Message-State: AOAM531NOAmMhmzwcnIMB3w1wuDTA4jMKievMgA9ropKIk9h+94u3X9t
 bHsAit4BJLLv03GbJS0pgh4uYcJXwFUa21IR
X-Google-Smtp-Source: ABdhPJxJEZECFmk9t1OoTcXPY8UZjRYEW9SutGZsotZFwtcHeKTlx+Bghir0+ZKuZYtHpdO5xCMoUw==
X-Received: by 2002:adf:f787:: with SMTP id q7mr45091526wrp.1.1636968550451;
 Mon, 15 Nov 2021 01:29:10 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:f56f:2409:301:93ad])
 by smtp.gmail.com with ESMTPSA id
 u2sm15871407wrs.17.2021.11.15.01.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 01:29:10 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: fixups for WeTek common dtsi
Date: Mon, 15 Nov 2021 10:29:04 +0100
Message-Id: <163696851316.448838.395017402297767954.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012052522.30873-1-christianshewitt@gmail.com>
References: <20211012052522.30873-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_012912_207288_6148899F 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi,

On Tue, 12 Oct 2021 05:25:19 +0000, Christian Hewitt wrote:
> Two fixes from work on u-boot support and following access to the original
> vendor schematics, plus a minor change to use revised LED bindings.
> 
> - Mark VDDIO_AO18 always-on and link hdmi-supply to fix HDMI on boot
> - Add missing GPIO binding
> - Update LED bindings
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/dt64)

[1/3] arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
      https://git.kernel.org/amlogic/c/8182a35868db5f053111d5d9d4da8fcb3f99259d
[2/3] arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
      https://git.kernel.org/amlogic/c/c019abb2feba3cbbd7cf7178f8e6499c4fa6fced
[3/3] arm64: dts: meson-gxbb-wetek: use updated LED bindings
      https://git.kernel.org/amlogic/c/1e9fc71213d784dfbd153289daf08fdfc87f32ba

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
