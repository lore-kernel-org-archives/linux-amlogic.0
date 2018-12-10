Return-Path: <SRS0=ipOD=OT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20D5C5CFFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:49:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845B62086D
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Dec 2018 20:49:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N/eBBCFT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="mB/jsXnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 845B62086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXCMcqOGd3L/zQTjGCaIjgg0DiLQUFu/u61uCEA/rUM=; b=N/eBBCFTkml1CJ
	4OxnNYOBtr3lHGWik6Emd8R0Ejmt4j6BMuXaPtS/ykSS4PsO5JIOZgCxRziV+v4v246RIFblG20e3
	uceZGgdlBY3Eja3HV9tejUo5KAKa3sx25N4oFnNEov6Rs1Q1GsG7DkMa1Z/USXiCl3OdxLonfA81s
	eW3LM84++baJ0e2z+7WUgg/syB+kNoSDLTYvXZHo3JAbv5Ir2v3DZreJ1S0iQV3WChV64MTNKssmh
	JMa64bbO5F8H9V6Fi3PzXn2qUB3pFQ1fVOOPvvRaCZxtlvcxQFEUWVP+zVSNOzBq4xEaCTf6vq+Ig
	anJeFCPlcUttzk8zQWNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSUb-00029F-2V; Mon, 10 Dec 2018 20:49:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSUY-000289-1F
 for linux-amlogic@lists.infradead.org; Mon, 10 Dec 2018 20:49:27 +0000
Received: by mail-pf1-x433.google.com with SMTP id i12so5959111pfo.7
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Dec 2018 12:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=JAfO4WTCr/1AVOKL+POAvaEEKQUqREQBDgoEe8LAsG0=;
 b=mB/jsXnfSHzTfv/n2nGSDpvjuyJjkg3wbGiil0mqVfRArJyUMcJzLnwxj8kZpinVHN
 G2DqCc3YkqDG5kXbe5hSf5ny1XbYpCsV1vE6YX+sDh77dPJCWiDCOlLlRXJQGCzKGZkH
 aQuL6sHwSRc+5vwPAqa76mN3KYnWWOFGffLmiMAuh6lPjY3NnASiLyHzi8bfIULbasmp
 JlS8/CfzexumJ4bPk+1KArUj4TEB8tTSd5XRy6M37AK4molUB9hi4utyEXDVaICZ5xrq
 VwtHdC33GVPpK4fVTYCXc2s4sewaRf7PQ4DlzzjeUh5UMIJhUAKvKtLVHGWm3gpEJcIE
 O+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=JAfO4WTCr/1AVOKL+POAvaEEKQUqREQBDgoEe8LAsG0=;
 b=CQ7QQEx7hXRCT3DBEp5fDENJHHdhVJkUxeje023yjjJUlo3Q7nSoVvkmLnfyc4lvrV
 6CeWSsucvuOIDvXJr/8R9XNnMb+G+fTqNq7kkTKQa31pIUWE25TM6WVqmM8nmSSe7C7b
 iB/jIB3P2TUhPbVK4o15Y35DXVLaLWxi9QBvoy5vZfncfJKS2F9ivGAIVNz1BQb2G69n
 wfhZLndgsyF0367JznJVRC4scP+8AQ+i/fpQ231bc0Pv8QselQKTxc3dXXzCeZaHiNzm
 qDjDTUykqTXNHGFVcpZG/35iacZxGPePxEWbRnH86QHfkRsragMNxNeu7iPRgswId5/h
 Gpfw==
X-Gm-Message-State: AA+aEWZfvq4foXlYWv1COalSp8XrLv6y6hgfxHxWpevbUNp+OWAY/znT
 dTnwLm4nrxwkwevDRPYbzHp6vNlcCMk=
X-Google-Smtp-Source: AFSGD/UkJq8OJBeMt6RhryRFrpTrZfSIwmmIhC7a8FLIL3f2fJkVu+IIKwjQbxzEtzSZL2fWyr1mWg==
X-Received: by 2002:a62:1c06:: with SMTP id c6mr13458088pfc.157.1544474955106; 
 Mon, 10 Dec 2018 12:49:15 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id k26sm30843161pgf.65.2018.12.10.12.49.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:49:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: dts: Amlogic updates for v4.21, round 2
Date: Mon, 10 Dec 2018 12:49:14 -0800
Message-ID: <7hbm5tw1it.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_124926_080890_4228C5EF 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arnd, Olof,

Please consider these updates for v4.21.

Note that this pull contains a merge of a stable commit from the clock
tree for a new clock ID.

Thanks,

Kevin

The following changes since commit 7b141abe4aa137f362d7324de5a49fd3105f570f:

  ARM: dts: meson: add the clock inputs for the Meson timer (2018-11-28 16:49:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt-2

for you to fetch changes up to c311552a8eadf1f9960e6126d23c4bf683ca9ae0:

  ARM: dts: meson: meson8b: add the CPU OPP tables (2018-12-04 16:48:14 -0800)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v4.21, round 2

Highlights
- add CPU OPP tables
- timers: add global timer and TWD

----------------------------------------------------------------
Kevin Hilman (1):
      Merge tag 'meson-clk-headers-4.21-1' of git://github.com/BayLibre/clk-meson into v4.21/dt

Martin Blumenstingl (8):
      dt-bindings: clock: meson8b: export the CPU post dividers
      ARM: dts: meson: group the Cortex-A5 / Cortex-A9 peripherals
      ARM: dts: meson8: add the ARM TWD timer
      ARM: dts: meson8: add the Cortex-A9 global timer
      ARM: dts: meson8b: add the ARM TWD timer
      ARM: dts: meson8b: add the Cortex-A5 global timer
      ARM: dts: meson: meson8: add the CPU OPP table
      ARM: dts: meson: meson8b: add the CPU OPP tables

 arch/arm/boot/dts/meson.dtsi             |  24 ++++++++++++++++--------
 arch/arm/boot/dts/meson8.dtsi            | 104 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 arch/arm/boot/dts/meson8b.dtsi           |  98 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----
 include/dt-bindings/clock/meson8b-clkc.h |   4 ++++
 4 files changed, 212 insertions(+), 18 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
