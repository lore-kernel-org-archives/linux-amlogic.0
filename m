Return-Path: <SRS0=wfDe=WU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57612C3A59E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 18:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2693E206B7
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Aug 2019 18:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sx2+18B2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEwBv8bt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2693E206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NiFKtU0HFH5IAEdgg52Te+tmsw+FrvK+1FmRn+IUR/4=; b=sx2+18B2QlCDoE
	5k2h/OR5puIUhUc4Pop7IOVW9bAJDWMvLo1BzqzzIDs/I4iKv2qXuU2s3AYvrFKjZVlv9dwOwrnbW
	AzjIgRMAIZ4jRNKS5NcH8E8DDIvOo62sdWHHq2ntM0bJ83nHDB9LCy1r9Y+Dgbh/j33lp80K6kLw1
	uiJh3t/hQFsBREVBW0hVI50bJaTvne5C/Aixe257edKZC5dQgZgSsPGb6uQcUvCtfgaZ1DPiyFRGu
	a9GbX1MSD9CcGj5hWuT7IngLm20PPk1BrZVHueQ/gbMAPYlUWqRFoiY5+zfsWthb1xLa5QAPcl4yf
	tEKXJhc3kluM3xny4XaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1b6X-0004rl-CZ; Sat, 24 Aug 2019 18:49:37 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1b6J-0004hk-Lb; Sat, 24 Aug 2019 18:49:25 +0000
Received: by mail-pg1-x534.google.com with SMTP id m3so7814826pgv.13;
 Sat, 24 Aug 2019 11:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5fAoCSunKyneQTnxswt2lZAvNjsVlaAOR0R91zCLtY=;
 b=FEwBv8btTNIYphxJxntCEk1P1gSbJ23VCP2kFlrutJ/W2DM07vIMjMhN01WntGgWWc
 SpTIhC+t9l2Is3kJPeI+6uNFlmLNmTtudjQpw68gcXHJryP1x6LL34+XIapDJg/C5YeZ
 qE9U+O85LEyzbFeZe6FPnr1MEGiyJ8TjYJ/4GDfELJ52filMQTv+20c8H4H8uHar9gK5
 8zWOcOd1XLXF9Lp1Siqa8PWA9m7n5rkzl2Zt8rbf3ztyMlS46DVbMrTWKFtWLU5PdIgR
 awTg7/ArU6pNTVB1d0N6cPAs3fpqoEMaMo95nasUkoeh1slE5dXJDh39BIBgjHR+fooy
 OzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I5fAoCSunKyneQTnxswt2lZAvNjsVlaAOR0R91zCLtY=;
 b=Ta1O2PzF16+mRSyyqQ/Aq8G9+M2Z+bzj5cXUYxLJ6lwvOI+yin5H998uWicQ56+l1b
 SFkF3XxKrv0zRAYxW8gPNCuIlf2Sw45qIZKDlwTTU8h6CW3eRkj41ZFqTkil5K74yqVw
 hhFZlyDtPth/jVTV0cdX94AeeQVppH1i87XYtll+2T0qTXe9xW/V3DSIlOsJuZONyyCJ
 tOLfINsx4M6V78iZ0yxInwx9GO+dXmb9bgZNUaUAsxUa/6AY0ibVDWIDMibZiL+Bttle
 a1gQXDX4kF3qcOpoiCh+CzmF3CKkwr4dnxwEgdfnpRSgvuInzqEOKc14wHQ2AFespsef
 UhbQ==
X-Gm-Message-State: APjAAAVYYSYrHERP1EAbamjkvL3CqvAqDpmzdbZYxPcgckbJOMg0F6dZ
 7XmqLJZOeXdvRpdG2J/zq5I=
X-Google-Smtp-Source: APXvYqx9uWXRu5STlTuhhddKk5s+NXsSeIbWWPfxTYTrEsTy7Epo+SsjR8s1Ko1fAa3ulcwtF00Qxw==
X-Received: by 2002:a63:31cc:: with SMTP id x195mr9042601pgx.147.1566672560712; 
 Sat, 24 Aug 2019 11:49:20 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.111])
 by smtp.gmail.com with ESMTPSA id t8sm5519292pji.24.2019.08.24.11.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2019 11:49:20 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv4 0/3] Odroid c2 usb fixs
Date: Sat, 24 Aug 2019 18:49:09 +0000
Message-Id: <20190824184912.795-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190824_114923_709036_566572BB 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Some time ago I had tired to enable usb bus 1 for Odroid C2/C1
but it's look like some more work is needed to u-boot and
usb_phy driver to initialize this port.

Below patches tries to address the issue regarding usb bus 2 (4 port)
while disable the usb bus 1 on this board.

Prevoius patch
[0] https://lkml.org/lkml/2019/1/29/325
I have tried to split the patchs for now.

Anand Moon (3):
  arm64: dts: meson: odroid-c2: p5v0 is the main 5V power input
  arm64: dts: meson: odroid-c2: Add missing linking regulator to usb bus
  arm64: dts: meson: odroid-c2: Disable usb_otg bus to avoid power
    failed warning

 .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
