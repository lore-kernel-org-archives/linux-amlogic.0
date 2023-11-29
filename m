Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA9FC07E97
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Nov 2023 12:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KyIxZXo+g1YHgup+RaSpiNvDO2FX9V3KfyJnE+TpePg=; b=GBMZe8P24PE4iB
	t4Ezb8k6itMLBYaE4nwjIA59BzEK2jnJIl3O1KFn9x5GwP3meOgLjk9l0xPqp0caN8nUW5KLmpYJJ
	V0oVpYiPuU50Tw6OhJlTrCYg9pjp/OuvwnvsQT0dD1rOs6VchSIQPU7NeFzVntekYkKR/X7SIKdNE
	WIz+3kuoweo1l+TuSbxcOGtqZEbqoio+MONQWMRfUSMJO6k47VNdSiQbuwwbRuuvQYBA1QjHSx+MX
	Z3Ie0NS4BnB86ySkhtbIorhMf6a7KZl2IrA7Fg5kWSIcNdFdwPeDmHZGUgUdy8DZwpthPbhtDXxtE
	6rdi+YOq2cCv2MmExiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JIm-008E6z-2E;
	Wed, 29 Nov 2023 12:04:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8JIj-008E4e-2s
	for linux-amlogic@lists.infradead.org;
	Wed, 29 Nov 2023 12:04:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <pza@pengutronix.de>)
	id 1r8JIe-0000FU-CF; Wed, 29 Nov 2023 13:04:16 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pza@pengutronix.de>)
	id 1r8JId-00COSL-5t; Wed, 29 Nov 2023 13:04:15 +0100
Received: from pza by pty.whiteo.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <pza@pengutronix.de>)
	id 1r8JIc-00ACOT-SR; Wed, 29 Nov 2023 13:04:14 +0100
Date: Wed, 29 Nov 2023 13:04:14 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	zelong dong <zelong.dong@amlogic.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	yonghui.yu@amlogic.com, kelvin.zhang@amlogic.com
Subject: Re: [PATCH v4 0/3] reset: amlogic-c3: add reset driver
Message-ID: <170125879173.1541321.8685946591376454572.b4-ty@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230914064018.18790-1-zelong.dong@amlogic.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_040421_926630_E0CD6900 
X-CRM114-Status: UNSURE (   9.82  )
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

On Thu, 14 Sep 2023 14:40:15 +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> This patchset adds Reset controller driver support for Amlogic C3 SoC.
> The RESET registers count and offset for C3 Soc are same as S4 Soc.
> 
> Changes since v1:
> - remove Change-ID
> - run scripts/checkpatch.pl and fix reported warnings
> - sort dts node by base reg offset
> 
> [...]

Applied patches 1 and 2 to reset/next, thanks!

[1/3] dt-bindings: reset: Add compatible and DT bindings for Amlogic C3 Reset Controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=0c0ea61c9b3a
[2/3] reset: reset-meson: add support for Amlogic C3 SoC Reset Controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=41df5d7d5e99

regards
Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
