Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E98B4C3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA74522CEC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cq0ag7gy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W2cwkRF+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VwfExEy2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA74522CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxKBcuP7bOnNuWFxkqqRI2M0S12fdxvBGDvWBgYcQo8=; b=cq0ag7gyoU0T07
	ZFXCayFE9XyPDgpEAtsJJ1IiOdy8NgS2RgOk3qpDhM/b9m+zsngg/sO3sDZx/q6AahwFgM/Y7YoKN
	W6aBvjlkNQnPZwULcFF1T4azmLT+l+rUjvfc4HeHcvz7MvNH2Kav6WgzHHNIF3gEbznmlfBVRM3uf
	2tQ+uH5Padz3RjdmUuEIFxhyXB8jw9MfCBvr2aXZs2eq3J2H0p+YItsoXxecFHXqw8GgOnqhHh17x
	i/PKctu73gEONki+w8XamckALU/sSESPYdIO9YZqi91XFjgWhV97dPL/+/Jwj36uQITYKc5rdRTFo
	L6Wu74f5jxbvBqGMYvGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13ug-0006Ss-O1; Fri, 23 Aug 2019 07:23:10 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bS-0001Hn-3q
 for linux-amlogic@bombadil.infradead.org; Fri, 23 Aug 2019 07:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BYS/jLJ5SnTBfvUO73YfQ/qZMgKSxQ0+sfqUXBWxFgE=; b=W2cwkRF+hKzaS+eaaw8fQdut4q
 7UdDHTDaTabh9jZTnLaocsLarNMPMH077zvj67kYiyDq8WGvZXzA24E22fwvozCFRu4fuhYIUEwcX
 WFsaK1rQ+jG/6b/9A0X5mHk7IjemXzcfRoPhXZDVm1ephwtfqiMB0QXhAgWed3VItqxEM24ZZlop0
 dqz6LNwOsxYO4I3Mmi0+SFU10Pa+QJKuIso+1zxD59oclYNUn6iFLtzDZEs8IIt5wKPPNcivC9iOp
 EYtsWft7PQFJtUTus2AqpS02j9RXY9tbZ4kZvEdtrd6pB2K7Alq1TlDKfz38uiTk43H/oiBKRVhxZ
 DQfnGlMw==;
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bO-0006V9-UY
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:16 +0000
Received: by mail-wm1-x341.google.com with SMTP id p77so8632265wme.0
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BYS/jLJ5SnTBfvUO73YfQ/qZMgKSxQ0+sfqUXBWxFgE=;
 b=VwfExEy20yJXYNxH8LKSGd6Mc3F55oX0J7Yva343vW5KwrjHbcdmyjuoNkCU/Zm7P9
 jzK7TUODE2Onk7XXbzt2FkZE06iQnI0ME3K7CPJh8ywR2ZKnubK+Xg/6kZOEe8q4Zmt2
 F0JyeHph/zSHkuFZfaDQippYQWw9HRrWgM+NEneHXMwN0p7mih38B/WvFxlgnLb/WBVy
 mLyK8tgI2Vu5NL+T4jFyOofLadOGW92CHCx0dI7qnga28Hij/IVDL55UraU7h8sgtNpa
 HzcHRqGlHigHegh5c5QFXnkrctrRhqqrm/xm//OhwuVxQ0fDj9hUV9yd+DrNLOJJT4jN
 8X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BYS/jLJ5SnTBfvUO73YfQ/qZMgKSxQ0+sfqUXBWxFgE=;
 b=iXpaR3DrZ0fca3EVnqq9D+34tiQVqigCurwbhGho4/R19wGy2N+G4H5WpC1HMM37DS
 f5RTTFCoimmdAhRwh8YfRhzp6Anp2YZ5p0YhW07IZh6XvapTYfWnLYySxOQ0rxcMQ88Q
 9hAB2X7ac1UF+MuDqd0ZGdMTey4zJRoOzpNfIVclbn79E5qPvTSRBv8P+JcbgMW22suv
 s6irLZfobYBpBcq5dOaoW7dvRei+E/BZKD8YKD8jT1/DDHn8Oud0IQcNTyGwlSlGIlUS
 I7JqhC21eCdwhGzN0THbWx2gGixGAgVUP0x1LsMnr5F1D5kfTyNe3i327zWGxZqMJ5vh
 WcQA==
X-Gm-Message-State: APjAAAWiKwzNFuUWiTFT6H6HuK6FAJbbfal7PYomijU4zvf7ZW6UtfoU
 tpUUInjyvImKuJ00bcuuB1wLBA==
X-Google-Smtp-Source: APXvYqxDBCBALfUY1roCUtb5nFCGs8ULUeZhn4O/3BvnRzigx377XPNv7t8/+DlNYXkU7+9hRiHjCQ==
X-Received: by 2002:a1c:d185:: with SMTP id i127mr3334208wmg.63.1566543783727; 
 Fri, 23 Aug 2019 00:03:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:03:03 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 10/14] arm64: dts: meson-g12a: fix reset controller
 compatible
Date: Fri, 23 Aug 2019 09:02:44 +0200
Message-Id: <20190823070248.25832-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-g12a-u200.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']
meson-g12a-sei510.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1a5efa2e16c5..d09c7a5cccb4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2187,8 +2187,7 @@
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
 
 			reset: reset-controller@1004 {
-				compatible = "amlogic,meson-g12a-reset",
-					     "amlogic,meson-axg-reset";
+				compatible = "amlogic,meson-axg-reset";
 				reg = <0x0 0x1004 0x0 0x9c>;
 				#reset-cells = <1>;
 			};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
