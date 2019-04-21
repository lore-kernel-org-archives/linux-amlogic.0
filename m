Return-Path: <SRS0=TOuI=SX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E553C10F14
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:43:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F053F2087B
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Apr 2019 14:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VJXe+k9a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="uD5J2pa8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F053F2087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ZTC/hZQc0mMa3DxymdQVD5k1Y9aGkOVvT3p5wST4Rk=; b=VJXe+k9aNje+3S
	6yNYQOdDbcIvaOcln82FfZjJBZONR9LQ4hahpvD/QXYzMj/6yfxIBYSZaK04dISs+Cq/FoZJZ4gb4
	5DR4c/mX3Mn35y/hZKGlQLKxkzgkPf30QV6QHvsj+MIW+x2veqq/+JBzL936pNvdse2d+zYoNLK5R
	KHxQ6MyrgkCCAlz0WeFtTVs/VyZD0NnS8e9xxv2Xr2rkcm7FrxqtTXBzT/YQ9QoHy+nqXhCLf6mo8
	NJtpKLPPMWiOoUJkGoLnFXGWQKgHPErmnA29S1xNMISgV3CLQmtZAy8GdX1K70MtLdw7esiR0Wb8R
	JDgu2w2rzWDUEalgpNwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIDgb-0008Eo-16; Sun, 21 Apr 2019 14:43:17 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIDgY-0008ED-6V
 for linux-amlogic@lists.infradead.org; Sun, 21 Apr 2019 14:43:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id e92so2863225plb.6
 for <linux-amlogic@lists.infradead.org>; Sun, 21 Apr 2019 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=r/Oz0Bp8/VQQqMJA4Yllos1kKBgUnBGClTxXtzwHtpw=;
 b=uD5J2pa8KZVTRxFP6AcKOSgKqrXz5mx1DIWbaW/86Fgmz+eIGGPA5pBAuJqnxBvkBx
 TjSnj+3Jr4mGcDSU03f2o5aE4sWj2dtF0eC52IwEVO8SuImEhd6MVTKZmmvBeURRBT+V
 v8Eq/RFf95vXDVsgl37tCfeLDeFmrZU6hS+AnKjed6zfooglx5cekw++nwBXIvAy2mrT
 UqWH/VGH5AlI0zUC0DsJw+4cnNL/dOAaHMwT3uapgTywvIjqZ88wFtMqsSszf8Hcw5j4
 dcWRJqUn+MYfcd6ntrbMfCuy2TqqXmBB8uIPErYoCpQwa1L2kiFfzRf742/JHhB1uH0U
 oolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=r/Oz0Bp8/VQQqMJA4Yllos1kKBgUnBGClTxXtzwHtpw=;
 b=fFkMXiMmWbXhYe9n8BABgeF51ZGCsmEHnfOwL2eXHEzfKmi2rAhOoXHdBHoTPXQZgv
 71KAZ8nXke4cCnPtB5f2qh9g9IBmc2pIHHXrxIAtI4Yili1skefT7yeYbPNHw4R7bDVE
 LvHuKdR14NrE6pLzA+Pnl0VZ6DjK5efFBV8AY5gBTwYUhhzF489mHgJ/1bWfxI4qcMCD
 dHqsPA0iwHbF09UJ7nVK+rOl/IAp2X9ztzdf/us5SHS4rNJuQ0veK4YXZ0UaBcRAEXrm
 eaNb0BVg8t9xLj++o6pICSiM8xmb79ZvtODAKNDuml1h72ihqPwjsNrUWAT9KRYL/DHV
 Sv0g==
X-Gm-Message-State: APjAAAX2s6Z+/dHVDBvaZP3suRqwkq+6OemIOCuAZHCsz3+VZL+V34Wv
 v6nMThJuekNSLDxoYnra65QjdA==
X-Google-Smtp-Source: APXvYqzcSubjFB20AGbGVUrJLoCJOYyOaS+ZXAEVJoNlGFoWr/m8dvXmh61c7omuSjQ0d5CiyDumGw==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr14974566plm.261.1555857793375; 
 Sun, 21 Apr 2019 07:43:13 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6d49:9ddc:13aa:21c9])
 by smtp.googlemail.com with ESMTPSA id
 v82sm18786656pfa.170.2019.04.21.07.43.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 21 Apr 2019 07:43:12 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: arm@kernel.org
Subject: [GIT PULL] ARM: dts: Amlogic updates for v5.2, round 2
Date: Sun, 21 Apr 2019 07:43:12 -0700
Message-ID: <7htvera073.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190421_074314_241367_0F2E0AFC 
X-CRM114-Status: UNSURE (   9.08  )
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

The following changes since commit 07f9da2900674e8e7b15b090b878d8defe223277:

  ARM: dts: meson8b: odroidc1: add the GPIO line names (2019-03-29 13:59:02 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt-2

for you to fetch changes up to 09ee951617d9af8a86d228b2ed34035076ab6001:

  ARM: dts: meson8b: odroid-c1: prepare support for the RTC (2019-04-16 11:58:00 -0700)

----------------------------------------------------------------
ARM: dts: Amlogic updates for v5.2, round 2
- enable RTC on odroid-c1, ec100
- meson8: add internal clock measurer

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson: add support for the RTC
      ARM: dts: meson8b: ec100: enable the RTC
      ARM: dts: meson8b: odroid-c1: prepare support for the RTC

 arch/arm/boot/dts/meson.dtsi           |  9 +++++++++
 arch/arm/boot/dts/meson8.dtsi          |  5 +++++
 arch/arm/boot/dts/meson8b-ec100.dts    | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b-odroidc1.dts | 14 ++++++++++++++
 arch/arm/boot/dts/meson8b.dtsi         |  5 +++++
 5 files changed, 47 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
