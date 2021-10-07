Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88EFC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 18:01:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B7DE60FC3
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 18:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B7DE60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gZp4KhnwUkzWxdxo4k3MYv34jM7eo6846sEyiC+ccrw=; b=vFs
	HJVaF0f/o+360wUaQp4u6SjgCl80U80urp/Y7+E27ZYCst3EWFs8vBofcAtiIcXm6CF30urixAkb8
	a6cnmg/0HemmRyH9n7ksnbaSMVO+R+bSDUE4VKuCZkJo1Pgx9MtIpZ2WMULKCeUxjR2US/zeHvNOR
	0+BMnE40qBHhDhfGM/Mgw4oeXOsIS6iFcVtp7175qI2R6GiYvrG3cUjTGsOMi+SpKD/K8fD+Y/jFf
	i+I59hye8/kagxRd2MzYd+yRUqf4I0F9nYFrFA5m8onQXw1IgAgBz0nCGM3WpZ9U6T0a8ZkEo5+y6
	KGF20inoIF6ZKf17P3An2I+ovVoOepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYXiA-000Ret-CV; Thu, 07 Oct 2021 18:01:42 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYXi8-000RdN-5D
 for linux-amlogic@lists.infradead.org; Thu, 07 Oct 2021 18:01:41 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id
 z2-20020a254c02000000b005b68ef4fe24so8944845yba.11
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Oct 2021 11:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=r+cHeTTjO90PS0eai6zYLqlbbghwPCf4HX8fINZOrVo=;
 b=Tjg2WjHfqsfjG9mnJjznbqm0FF467Q9VNpX0aEArMWSepyKbuBHLNlmMbaDi7qGYhR
 F9Pic6KqWxOcXpUtvN52KN8qlZwlfSge+4y5rzEj5PEA3zLZZpqcSw7BUqWmjUs6QKU0
 GZG194aZ+ZW/Sq7DWmKCCLPhKu7zv0/EQj55JY3vCfGpMb8gYGwvuEaILnWiBg0mJoMU
 Ig8W2Dt1KZdj4HBYBef75fDxRtkEO55z6rsMJesDF8krBEt072ZNjR3yuEu6d9ruV7Zc
 YZ0V4993yXOALPAl6pZjDoQ+ErPzYZwueMTvehX/U2aYVarIzkhjmfo1tV4oxte3QiWU
 jhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=r+cHeTTjO90PS0eai6zYLqlbbghwPCf4HX8fINZOrVo=;
 b=53Vn2MMohOgN2V5bnlEyh8iVH0bo/vuIzhGsvM3RsQuRw8kpl0ZGyyl2MVGL3uYOFC
 KmRNeTi+xMhoeNClmSKQZ2iT//p2HcFrofvLmpegiSqMuubyFfFuKCrg7hrWeQJziPIk
 pnoi+ZGEYE6/o13Jwi7cTksq3pyTAdpU2kEJQhtSb4DE36ugkvIixtD88LCWXqsqugIR
 MSjIIIpFgQaq7MttH+jF6ng+mecQGmId1CDBkpoAOrKL1uJqgOo0hX9L7zW1MX4RB1AD
 0Umn+bRmk6UtnN7KxXjEHyazjaAZHpXWIPIpNSAVXgeo1jqPP4iBVs4RIgZOv/xxPdyx
 zbjA==
X-Gm-Message-State: AOAM533gUxL2u6zE+zDGtvw2NbTFZ/TB7waO/GoY4Z2T6hJP259ewOFU
 wQrRQOUA8EoW9qZwHpQXxT10i5YFdkcuioQ=
X-Google-Smtp-Source: ABdhPJzWbLRRvZtWkRt5K+FUZHphlko/RfXWxtqFNHXnvPylWZf8nOuluf3xvj1LHzqYLeg9YAbmfXwpj75quVo=
X-Received: from dimitry-linux.mtv.corp.google.com
 ([2620:15c:201:2:153:83c6:87f9:e276])
 (user=dimitrysh job=sendgmr) by 2002:a25:f803:: with SMTP id
 u3mr6344481ybd.386.1633629697804; Thu, 07 Oct 2021 11:01:37 -0700 (PDT)
Date: Thu,  7 Oct 2021 11:01:30 -0700
Message-Id: <20211007180130.805401-1-dimitrysh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH] arm64: dts: meson-sm1-odroid: add cec nodes
From: Dmitry Shmidt <dimitrysh@google.com>
To: narmstrong@baylibre.com, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Shmidt <dimitrysh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_110140_215939_EFDD3D08 
X-CRM114-Status: UNSURE (   7.92  )
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

Enable CEC in same way it is done for other meson odroid devices

Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index fd0ad85c165b..7eed4849233d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -225,6 +225,20 @@ &arb {
 	status = "okay";
 };
 
+&cec_AO {
+	pinctrl-0 = <&cec_ao_a_h_pins>;
+	pinctrl-names = "default";
+	status = "disabled";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
+&cecb_AO {
+	pinctrl-0 = <&cec_ao_b_h_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	hdmi-phandle = <&hdmi_tx>;
+};
+
 &clkc_audio {
 	status = "okay";
 };
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
