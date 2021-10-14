Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4050C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:27:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B70B60EBB
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 15:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B70B60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEiVGKfwYDGXRVU9JizaHlVD5UPoB0l8Kdsc+M0EVdw=; b=oLBlXk7rXfpNB/
	tVMMrW18GeDtomWjq56M9CmFN9yitR/OThKZtNAppyf2LJBc0HG4yM4mz6p+RxlsdTOTe+4Yhy53+
	VgvhGbtSqCJdBbxjgKtpyMS4c8w/z3h8Nl/2Z5D0o0kspcvXuQ9L4u8U8MRI3EUW1AVKn6SfSH6X3
	x+Rx9m8MaakOM50ZMWM+a6e6OT6rSYwE7KCDzvWFXcTSfzpArSSuYdcBxb6/1OC5Dh6YOHZqFNh0i
	vvqfVAVHZTgRZKkUdz9OSdzxBhUMXhnoAsAxr2qzbku9rMKr5ivWxEtI2jKvEoeNiCLOhbQIPT39r
	s6PlmmVYCmaYR8w5LiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb2dP-003diw-72; Thu, 14 Oct 2021 15:27:07 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb2cb-003dMl-NA
 for linux-amlogic@lists.infradead.org; Thu, 14 Oct 2021 15:26:20 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r18so20734641wrg.6
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Oct 2021 08:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJdt9xqgEepFbtbB1UkquFZ4VDLNOq6El+raZeZWSOM=;
 b=pt34RyPq6TeilQMWvaHMCBd0p6iBB5mQ8zyO7bsO0z01t93qtPnfhTtxhynXcJCNZI
 iejhkLmblTXq7J0R4WWX12xrJSxTJW0L0GLzhdteU9CAgzcrwsJlco9WizJRgcsgkMlf
 5SSeCrL3ajGsL5O2s7oUzFOnkoSIkFyX4d5TNYLMjAG3Obr8FEN2lK+YUXNF9NydQi1L
 P39e94inxhD6MtuCe4rImRHiIoHLnIIucIf205t/kkHURxK51E89grzki14Vr/RhGiA5
 p+Y1BsN/CDaqCfhOWBrF0dJNqtR+7ZDFhXLL1nhfz0eac2nIjIR7sxin3uJohE6T1QLY
 x/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJdt9xqgEepFbtbB1UkquFZ4VDLNOq6El+raZeZWSOM=;
 b=H8cRd6KsiikQG62Ml7T2gVqgUmf++yPpD4p6smn3ZK3s02IWPjhT/9FInQncSk5d1O
 hUNTbpcmK0S7tAfRLyK2jUfzx+6WnZYSqes9z4dilFUV4JRwOluiHnlkKwGgeBcDWjwL
 R6kEar4+WQWIGmGiqQw6BPlHHPv8iNY3lWzsRiw1NqzP/1sM5pp4M5grnWCDgGDl3ex1
 yTvzbhSwMsZ9GfverM7s/i5iJMIKVk4H6FDUwBOUJIMD2/YRM6165RZmvgLvXoRCbQKK
 i7mMDOZty/NT8fYaQEj1Ya3rhNoCoNQO0qLbOXKlqhrkSMzoJ0Ymo/fwX7xvrIWZ5sDc
 d4Ug==
X-Gm-Message-State: AOAM531JJk+/UYy+mGd3+7ztIbXesxuGw4nkzbymj5jVoAVRjGH+/JLD
 7asYxXwgBKrdN7sQ6p40ll2e7g==
X-Google-Smtp-Source: ABdhPJwK/ywxZ2fw2tMZOvBzRr4/yRNBMI1ZBNntxWcjpPuqQLTvL/JRBJL2y5JNH7j8BDDkiWNjnA==
X-Received: by 2002:adf:aa92:: with SMTP id h18mr7277007wrc.372.1634225176290; 
 Thu, 14 Oct 2021 08:26:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:209b:8400:2b80:b4ae])
 by smtp.gmail.com with ESMTPSA id k22sm2626790wrd.59.2021.10.14.08.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 08:26:15 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 4/7] drm/bridge: synopsys: dw-hdmi: also allow interlace on
 bridge
Date: Thu, 14 Oct 2021 17:26:03 +0200
Message-Id: <20211014152606.2289528-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014152606.2289528-1-narmstrong@baylibre.com>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=VqFA57uYRVnBWiC14bz6QM29bBtN5sRjm8xb2MmDNeU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBhaEuAk+fmsK54XgR9Ufj2kk92eYhEp32GG1J/nqjJ
 orc3ih6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYWhLgAAKCRB33NvayMhJ0VXbD/
 sHJAJpjVaCD1jpnUNddl/tWvU1cQ93DRTHgJCZ4Vr+G+868TYNoXo/scludQSH488DVMDjgGBIJy3M
 6jK35EeZgBAUAuD1qmSVEe+aawSSejSlM2Lsfem+TqSWohfPnegZ0q1E66Hm3VUWoaECFyJRPW8i/d
 24vn91yOmynCdVKzNMndB5roqofG/5fPGZ1aDi74uySqBv4Cn7ZZ7Hg93KLAHVmcF/NvWr8TquzgCW
 zq5WoxWT+SIHWoqHLW8LAQTzTLzlNlGkAy15eFAE5PK4cSJebUxX9M+Fn8CEzedh8OsnRffzrydbh8
 Bk3deAPoxjBKasnYv0xs1/zGc7Ya6Dic/085flzUlDSUjqz8HounBW3Nttrn7+w+wSvl8kgRm2/a+c
 bEG+nDgyUN/TGEBO45quuzXh7rTcK8aYsjixdqxkrQC3cbI5dXEs/5j8YWIPVFVfujGPCV+8rHy2Oj
 H1nPVMzDhd1JPMQ/rx+gZXzQ2U8L2DfxgxG5SUNpX+LJfs7yYLrtVG9aYoEj+goPNPU4txlZK9JaFZ
 Z1I8clZ/y5FdnnYlBF8iv/R5iCw+CGoZJuNCc7uriMIM0hfwTGGxD/RuQDMSlh+WMj8ULonwqM8rHz
 w6y1ruDofp+/TouykxmSWQSPPjwQvBgpLLPoa3VnSsUV55ANFAqA23zsLhOA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_082617_799035_88645918 
X-CRM114-Status: UNSURE (   8.28  )
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

Since we allow interlace on the encoder, also allow it on the bridge
so we can allow interlaced modes when using DRM_BRIDGE_ATTACH_NO_CONNECTOR.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index f08d0fded61f..62ae63565d3a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -3413,6 +3413,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->bridge.funcs = &dw_hdmi_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 			 | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.interlace_allowed = true;
 #ifdef CONFIG_OF
 	hdmi->bridge.of_node = pdev->dev.of_node;
 #endif
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
