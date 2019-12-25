Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B69C2D0C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05F82063A
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OnT6GCiJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="L9vNQNnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05F82063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Cfh8DtynQlFFTEJAnJMDMozlYkM156lXXbRSleLErk=; b=OnT6GCiJ0zVqrA
	igs0emDbV+vnMQab3dsPMCuHC4I2ZOSHakKBklWIrAgB9UrOm643oig1TxCYTYOMifXpWQN/G684C
	aYQFBrwvX3DBlWcpEkySsVd32oxjC/yjdAa9/YIF38bYddO+vF7o+3bwzB2t+1BwpwtO23ojAG+J3
	4soB6Lyz0tz2ovGxes4mHRUWlmhcGW2Blta3yovc9dUWyMM/bMLin9VdB9d4rCjWI4Sff1PmKTS1S
	3Xb6bGNN/3/Z0gKjlo2yYPf63bwpaYj7IMOR6b14SIp9yaIz9UHKhPoKDvFQUwXxLyzphY0jPzTV1
	uo6GTtqHkIl1jWUhXrxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijv0X-0005YK-W3; Wed, 25 Dec 2019 00:58:38 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijuzs-0004vy-JG; Wed, 25 Dec 2019 00:57:57 +0000
Received: by mail-wm1-x341.google.com with SMTP id q9so1830442wmj.5;
 Tue, 24 Dec 2019 16:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7xaUferG7HAWecpJcxnOnz4oYDhKhjdfLvmFfZUZQK4=;
 b=L9vNQNnFaEGspbC0QRsDefYP16CFmPV+JMq+na4k4pspEeksqZ23LFmXN8OMUcLHQf
 4V2zoD0aHmMa5Fxyq+l20LTxCyj7UQrngOEpBQOGjF+Ju/BDuC2+brkHGTFLdZLWg+sc
 84YoXz2IPAuNIfwTiYf5jRBC67lV3HhdA1fNVptfaLPj0pnIbzQO1+Y3gwUDUUj2WFam
 yKXJD62lgd+ZwOLkz/zprhAzMXH6wg76NK9adOEENRUQ61w/i2K9uhUBc0EP0t9dA+gt
 DdnyKCsutNax4YBT5nGJc7hxLh1Oc8iwHVz3RDYOH+tdSa3ZAPB98RXT8I+M6pbWdM3v
 Bt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7xaUferG7HAWecpJcxnOnz4oYDhKhjdfLvmFfZUZQK4=;
 b=BGTUr429EZ2a9SF5XQ3sHYNbHcS/MDi2KbXR2inzu4FxstzhUSgMeikSxFL8DSfIW0
 8mMZ2LD+nzqZl5ANXdOuEZn4ACtBNGvnthqkBDqTxYL5tFwQltEQ23kPB0OX5iaPr69x
 B4cayIl97OJVsjMSVEPH328sBO1+/uLjnea/L48H77x/hXkcMeGEGhHe2TNaMcEaCb7M
 PEPbGz35rK52xQmYNOgeqoKxPvMcOpPFa2Xojdirwd66R3Lq5BUlAm0xngL3s9/nGR6j
 1HJ3/Uiyi0GwnM3R7FE/UXJD19frYMZCuGN8JdWLB7tyW/A34YL9fZDpcBJO0KKOzyb5
 5I3w==
X-Gm-Message-State: APjAAAXLI6wF79IIcpVeSwf7pywhC02VBJERKQ3I3+K+lXhw4U57RO4E
 vWJG4Pt4XWgMwlmA0RUN2gavaP5t
X-Google-Smtp-Source: APXvYqzE+4J+EBv4z0CzgDiPxQWZzZ7eL1fSoI4TT/crUG7n8l3YetIiwu2KCeBd2ZY+CHgYsCrjUA==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr5946155wmb.41.1577235475292;
 Tue, 24 Dec 2019 16:57:55 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id e18sm26034448wrw.70.2019.12.24.16.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 16:57:54 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 davem@davemloft.net, khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8b: odroidc1: use the same RGMII TX delay
 as u-boot
Date: Wed, 25 Dec 2019 01:56:54 +0100
Message-Id: <20191225005655.1502037-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_165756_629118_93DA86C0 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: linus.luessing@c0d3.blue, balbes-150@yandex.ru,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, ingrassia@epigenesys.com,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Due to a bug in the MPLL2 clock setup (which is used as input for the
RGMII TX clock) a TX delay of 2ns did not work previously. With a TX
delay of 4ns Ethernet worked enough to get an IP via DHCP but there was
still high packet loss when transmitting data.

Update the TX delay to 2ns - which is the same value that u-boot and the
vendor kernel use - to fix the packet loss when transmitting data.

Fixes: 9c15795a4f96cb ("ARM: dts: meson8b-odroidc1: ethernet support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index a2a47804fc4a..e2ba2d66d8d9 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -204,7 +204,7 @@ &ethmac {
 
 	phy-mode = "rgmii";
 	phy-handle = <&eth_phy>;
-	amlogic,tx-delay-ns = <4>;
+	amlogic,tx-delay-ns = <2>;
 
 	nvmem-cells = <&ethernet_mac_address>;
 	nvmem-cell-names = "mac-address";
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
