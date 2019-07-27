Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F227C76186
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE410208C0
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BQ7ts2tN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Q6OtNLAb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE410208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DctbEJpjqyBSQ9kbxGQS7fwyxPfL/iEesa7TynXySek=; b=BQ7ts2tNlxNBv+
	38IJonSbby9I0a/ybkgFG8/bDka8fOHyAQwL+FJpj+N28lQWj8vIljXe2T+/L18JbK69mAC0mlLwh
	w7Cn02FpL0lvNM5wMxcSPGk+WVuAnI3d8t8JvS3xjqE6o++s8hJEKpkEZAoLhYhM8ebVVSnpKTU/m
	1tUf0BH3Ou72I/sm+b7lbkBLZe5fUTDVkPOqLLjkpwmJPxsjYtA4LaJuNSNMPzGxDPtNbCE4TZHsV
	dryq9GdpnAK4JVxCzW/dVkvBJMZwK74HawzKAH5OeAz9EcN0V9NPQGpbAEIp9ilkSydJeZ1Ly5raW
	3oxnUL3tMGUW3jG/lG/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrSeu-0000Ek-Ij; Sat, 27 Jul 2019 19:47:12 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrSes-0000Do-0F; Sat, 27 Jul 2019 19:47:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id s15so28881660wmj.3;
 Sat, 27 Jul 2019 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+3WZjP7t2c3MrxGBkykjVbFHd8lOWzlUy5DQ+uWLUE=;
 b=Q6OtNLAbEJJib3vgdqU0w3Hbvmi7fV5CHysk66nylrKE58lqu1BtdTnDU1VCIiQRey
 Ygjmy2MQ+DRtmHsSXu9ItrEKM2vCi37kAj3ML0SPsgES8Jj8SUFoCkyZApz/eZ+wxu8C
 N6lD/VfJyZTU2QzS7iOqtKBhjgtybFoPqmUG7c/QU1WbObojh4iF/L7VRhDYGcyFz07f
 4wSjkx9t+Bk65HenKqzVQqitsOJB1eDLlUUbTGVRqUg1LQvkgyOTSoKYMjhl7SfdvAqI
 eDwu65ReG9R9pS45jsxZfPu02JfaSXtQwcp+PDbcTrJnaclCQ6z/L+m10H3TgbnJnhIt
 OrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G+3WZjP7t2c3MrxGBkykjVbFHd8lOWzlUy5DQ+uWLUE=;
 b=VL1tQmPUM+0ET+mzA6K2coPgf73RECSj16kzxOAO+p2ykOzF4nV5rFRBtPNWybpkfU
 E8ExgllfzvChVv9Su4LV849cSTbd4RPxKFBoglM11Lfp4oofk+glwp++yYLutjL519WW
 fPNEgLUQ6BZPPmgqErdRAl51MCDcnPpUaL3frVAjC3eicTYboqNmuA3j7WpuqrYu8d5L
 fRaNGc3cpQZBvGKWtXP9mH93TEXXUr5R4nHw8kMyeTEmO5+RlG2oi5YpI0yl4orx31Ao
 p8TW6pjgzV/e0u0ttjdgunYdsjMqQAGiY+iWtjEkGOeV0mxNbYx0iuB/+BquI/Cg+Ph3
 gVvw==
X-Gm-Message-State: APjAAAXlKYM6OQsqd9T2ggxYXalyC7mqqzYTjqlNjwXsChYJvlfR6jq+
 f4OAl3VBUoT6TSfErXr3QrVQSqqy
X-Google-Smtp-Source: APXvYqzOFRZqA8EOJZWI93/akWTx45etbPraNxCABgu2JkvQ2zD3E+Uicc3/5VHwDKM7ZY+Iwm7WTg==
X-Received: by 2002:a05:600c:24a:: with SMTP id
 10mr11358651wmj.7.1564256827873; 
 Sat, 27 Jul 2019 12:47:07 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id c4sm44651726wrt.86.2019.07.27.12.47.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 12:47:07 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 0/2] ARM: dts: meson8b: persistent MAC address for Odroid-C1
Date: Sat, 27 Jul 2019 21:46:45 +0200
Message-Id: <20190727194647.15355-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_124710_068456_BEC1D3BB 
X-CRM114-Status: UNSURE (   7.23  )
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
Cc: linux.amoon@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ottuzzi@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series makes Odroid-C1 use the MAC address which is programmed into
the eFuse.

build-time dependencies:
patches are based on top of "ARM: dts: meson8b: add VDDEE / mali-supply"
from [0]

runtime dependencies (without these a random MAC address is assigned,
just like before these patches):
- "nvmem: meson-mx-efuse: allow reading data smaller than word_size"
  from [1]
- "net: stmmac: manage errors returned by of_get_mac_address()" from [2]


[0] https://patchwork.kernel.org/cover/11062361/
[1] https://patchwork.kernel.org/patch/11062659/
[2] https://patchwork.kernel.org/patch/11062657/


Martin Blumenstingl (2):
  ARM: dts: meson8b: add the nvmem cell with the board's MAC address
  ARM: dts: meson8b: odroidc1: use the MAC address stored in the eFuse

 arch/arm/boot/dts/meson8b-odroidc1.dts | 3 +++
 arch/arm/boot/dts/meson8b.dtsi         | 4 ++++
 2 files changed, 7 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
