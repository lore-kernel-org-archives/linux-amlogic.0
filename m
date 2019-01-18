Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05131C43612
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA3DE2086D
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 10:34:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t9qQSkxX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sO740a5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA3DE2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aO+Zo+q/75Lk5eGhKqJNvxrZI/vCt1aPuD/wAVqoVaQ=; b=t9qQSkxXIsPtX7
	CvsB1RDvIZUvN0rADtriFMJskPmH4BJ43D4RksinP6qAeqMM+XeKk0BPycnnvXQOE+NT5Ub1Qhdtd
	mNxny4YaYdEZlnDvD6XgeZ909Odc3Lp98I0IoQwdDxS+TYdw3qSe47p955813CTH+bDetBXYhZJpp
	0MaBL7802tYQ5tLX+nz0kqW6iApMS7HdXK5s3rufVu/lw+0gxHQwkJUVAJ6z6L6Ufzg/Ntj49PjdR
	td26vgHVruZeO6mpfL9drOKLdDaUOPqZ306uviquR4W0XOIVUigQxJWveF6XNd9aExx6kZwdES67P
	Ikw/H/a2l/LjHMQsF0oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkRU1-0007i6-KW; Fri, 18 Jan 2019 10:34:41 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkRTy-0007hQ-7a
 for linux-amlogic@lists.infradead.org; Fri, 18 Jan 2019 10:34:39 +0000
Received: by mail-wr1-x442.google.com with SMTP id z5so14377336wrt.11
 for <linux-amlogic@lists.infradead.org>; Fri, 18 Jan 2019 02:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vQsdFB7zSu2fdgFvwxux5vAqSxQfjC79f0KKFbqqnxQ=;
 b=sO740a5eRJsCL9zNKH0EtLCBvcZ8dQZ7gYyUVfqixd/ElU65q5usoJbkbygaRgfxDe
 ZUnpKMHCzNaFxU4efzaQ+yCSqWhe44KlTUOLwOd17VF5Pk3ePbgw7UMufRGTrSCBlnSn
 zOC8p/s+bcKgpTh/gkQnvwSNXEfDtzdU4CsrRoG5NztvxOvD8e/HYuLjPpovPW9khLty
 XZ3T3L63zg9fvB+q+EWoSRtIL6DAi8sIW7IaqE4OHG7vC0vOnSlpK2YqZs6eYGbNwvLp
 GE9Lh1joq7mpMFesfW8WcZ1YvCP6dpChRpJpEjiAxO260S55xELpouWw3rwcFCBR0jMy
 JRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vQsdFB7zSu2fdgFvwxux5vAqSxQfjC79f0KKFbqqnxQ=;
 b=quEJtfih6nL8jQ8SMLvzNi4WkWtWmHqtEwkTbzc2P5bvaefK+tbN5/rJ/0KcxCvEfZ
 nWybBFBOb3OBgdw5MCA0rp4J8HyhyKsrBZ5OBPtx4irw5xz/wTFaD0dRKGj0O6sRMYqE
 RurmEbh0qjpg+8k0LeZdeuJCVgrKIGUZb/xgbMl8CJPuwYyplbenW8dade6v2c/rvRPl
 vlbEWg6TvL+cLNcb52czQOi5ixWctG7SReSSq5pvk6VT1gxisFsxXiRn7qK5LPvKAVaP
 Z3If0K6vU18EpgI/L0diGxulYM1QC9B99uU3PWPE8fm6M6pBVg3EwFkQBrZgoRhZAdu6
 XieA==
X-Gm-Message-State: AJcUukfZKsKrofLMo29c4njEIq25Oqagt+B+k7IEqgTSVrbm6ULfgMjy
 IUQdsEPo66uTxipqpGmzQA2eHg==
X-Google-Smtp-Source: ALg8bN5b63q7AurgEDVxG6WjpBGyi9gHQDhV3Q/egyIHjwg/ezJHxxgT0nO9EDQ0mB+XZuiiY9y7Ug==
X-Received: by 2002:a05:6000:1144:: with SMTP id
 d4mr15430631wrx.136.1547807676309; 
 Fri, 18 Jan 2019 02:34:36 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s16sm67066247wrt.77.2019.01.18.02.34.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 18 Jan 2019 02:34:35 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 0/4] soc: amlogic: clk-measure: add axg and g12a support
Date: Fri, 18 Jan 2019 11:34:19 +0100
Message-Id: <20190118103423.15075-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_023438_286062_9815437A 
X-CRM114-Status: UNSURE (   7.07  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset adds support for the axg and g12a SoC family in amlogic's
clock measure driver and enable it on the related devices

Changes since v1 [0]:
* re-order node in the g12a.dtsi
* change node name

[0]: https://lkml.kernel.org/r/20190117164838.8008-1-jbrunet@baylibre.com

Jerome Brunet (4):
  dt-bindings: amlogic: add new compatible devices to clk_measure
  soc: amlogic: clk-measure: add axg and g12a support
  arm64: dts: meson: axg: add clk measure support
  arm64: dts: meson: g12a: add clk measure support

 .../bindings/soc/amlogic/clk-measure.txt      |   2 +
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   |   5 +
 drivers/soc/amlogic/meson-clk-measure.c       | 194 ++++++++++++++++++
 4 files changed, 206 insertions(+)

-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
