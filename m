Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1D1C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:02:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F9F20673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:02:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ATVeluWs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aQf+Iy0n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F9F20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHW4CKaHuA0VP4IcuHzl12BguJ+Q/wzcs1dDSSb/H5E=; b=ATVeluWs3yHBn+
	jSs4iSD1Kuo/MEygHEQF1s7NSf86nPt0QfJ5ZXdE4WR6EmqE0p55AweRV4+lnQIw9o0+ge5l6FcWx
	BEvDJUD/fx4/K24PjdoEApEZ/mhOJzaoxwucw4UGEMqhyslSmWMfbKrAEeDJLp8TslkN3R14n/XBe
	RwAhdons3mVrln+BM26ckP5gwt01uz3JS5pQdZjz9N+FAPg/Bafyd3kna3R+LlXWhuAKsn2q54jkW
	WdliWtbrpALv/Vozrxu3wU8hO2s7ZocC/RswewiPxrWAAmktoQ5CjtQP5r50NUmQnX9nTmxGRtpKy
	WXecPE8H81mdy/AaOokw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdyZX-0003qX-0g; Thu, 20 Jun 2019 15:01:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyY3-0003BQ-Qr
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id f17so3510289wme.2
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=By2vibD8ed5SvKJiLslQhTFpnxDveNnIcoeXnTW3Wf0=;
 b=aQf+Iy0nQ0FQz8qVhHiGfNhuG8rZz4Xwl8uToXWSA9d/lK5cjgTn5CJbCx89xFVaUY
 zhvkAyBr0XVnDpxdj7Os7AjgRlMh3uMWCzy7V7QqvOBDr9m3wKmhkzqxgw02c/jmoZDd
 pkYbaHjQAE+XlY0OUqp+Tm3cMJVRI8gogX6H21TYpYDn6V0yTXXjkgr6zLhR1ccb/Qur
 Sy0w50kZ1kuE5m2WZZog4dyJjKa5qzizHbfwjscF+BBrU/SGTkIKzLvD9lbMoJIKyhFF
 vpshSB7255OsuDSy8vFEEwplNxQtoiCs3MhaVO1BfwvwWxNTNrQGApMOsLU8dmjwWgSg
 zkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=By2vibD8ed5SvKJiLslQhTFpnxDveNnIcoeXnTW3Wf0=;
 b=Xiv1h42zb1wSNDXChoIZnvsDCDbR/vyx+Ei0fRp+dH+qGCcdVHAEZ//G65U7UQOMHU
 Tgq5a/EOtvcQHsD72dP2BpQeIWaUna14NfWNcMeKxv3Khj8a6GLTmcpTxy3JWsvV3o1u
 HOj8WJxVzRx6Kc3tNr6la1lElwuSLgjxzr9hCp4vXItB2gSd61t4I3l5e5MFBpSNtW2w
 gfQVzeeBbdG1CeeTa/1qjWsZUk5wa0DLELEe4Sk70JO+5hA9oMFeh3Qw2RS/rw+iQExP
 m75IkVezn7tvEec3sbPb/3ZumnN8QQYo8WEtQy0BLJoSGUODgDPzzsI7enbeG1uoWlnz
 Fn4w==
X-Gm-Message-State: APjAAAXhN+XCD9mceoFWeESL4IsOqayKWoN+iB6DeIzZc4a5GimNrXvL
 r8fmz16OGIYymT9bEmXOmrfhMeL7G3bvfQ==
X-Google-Smtp-Source: APXvYqy4PpfMpc89fPxuLdkIg+PgewzWYS4fDQc+uPktXcbMW544oq2gwfbsa8I3ngP0nFcrvQzD3A==
X-Received: by 2002:a1c:f205:: with SMTP id s5mr81645wmc.14.1561042822413;
 Thu, 20 Jun 2019 08:00:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:21 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 02/14] clk: core: introduce clk_hw_set_parent()
Date: Thu, 20 Jun 2019 17:00:01 +0200
Message-Id: <20190620150013.13462-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080023_898883_D60FF200 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Introduce the clk_hw_set_parent() provider call to change parent of
a clock by using the clk_hw pointers.

This eases the clock reparenting from clock rate notifiers and
implementing DVFS with simpler code avoiding the boilerplates
functions as __clk_lookup(clk_hw_get_name()) then clk_set_parent().

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/clk.c            | 5 +++++
 include/linux/clk-provider.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index aa51756fd4d6..3e98f7dec626 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2490,6 +2490,11 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 	return ret;
 }
 
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *parent)
+{
+	return clk_core_set_parent_nolock(hw->core, parent->core);
+}
+
 /**
  * clk_set_parent - switch the parent of a mux clk
  * @clk: the mux clk whose input we are switching
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bb6118f79784..8a453380f9a4 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -812,6 +812,7 @@ unsigned int clk_hw_get_num_parents(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent(const struct clk_hw *hw);
 struct clk_hw *clk_hw_get_parent_by_index(const struct clk_hw *hw,
 					  unsigned int index);
+int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
 unsigned long __clk_get_flags(struct clk *clk);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
