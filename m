Return-Path: <SRS0=hrph=PL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A535AC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4357960F4B
	for <linux-amlogic@archiver.kernel.org>; Sat, 23 Oct 2021 21:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4357960F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmZ1djuy4BNnWYh0aYYNu9l9UAoRSA2GiQ3Cyrgk89I=; b=dP2ciA3WBLrmCb
	yeYWuFq5xXGR8W2AuUTeW7tGfFc84BRwTan0yUSQnufynVepwxjL3Tmt6yx8P37H6AlmIcMSCXt4b
	NQkbC/MOA0/TiS0GB5LoYm15fJPA24AxQJqZZ8fzNUuT271f0WLyB/V5ZMjno+rS2gULbPssTbXRb
	pblEE2epsbtQ/Jd8b2NInUK0crx6gui2bxtGYoxIsHcIHDAKVvG8tLZnCkx7x3qPW2R+AgwnABKUY
	aSFSREbx+DwzTmIuAueE/DaHlc9VshAbkieSkDPIoX0HV3NTh3LOQ3TBkD9hb1S4G+uAGQiOGEq8e
	Bj2A+7w/9nw8v5UOLkPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meOtM-00DPQv-Oc; Sat, 23 Oct 2021 21:49:28 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meOtJ-00DPOW-Lm; Sat, 23 Oct 2021 21:49:27 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4HcFH54ctbzQk3P;
 Sat, 23 Oct 2021 23:49:21 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635025759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jWE/C5K55XfcxXustPzNMgLokBOhJ1D/90fssSjBzI0=;
 b=YTsMxS7BaUz41ewU/i2ix3kPfqEpTX5ULdQSsG0eYomzbz0r1gAiqXn2lXLhC5jJ8QYKIg
 nf3AJ+ZsLNjP/0e1kv+e0i98fwmI9vGjVBKX/+jhv59qF1OGevFGoTGjTS9Xo8TMBdI0V2
 7DB5ZF3nEef0mIx9Q1oAjW+C+jXzuEEW392fBi5Ux8FZBUquXNDmQZNrcyIztiajfuZiqD
 m5tSzRC7K63vV9ZeYjIKBC+k7JU1RziQUppyX91UufQvj4kdW1vd73CiVSMdfG9PRZHE1R
 Ek88r9mjWjmztwU4QSL5sp9/lYP6QYViZRJK9WWYPef9cxEs/ZmjEoWHK94llA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1635025758; bh=BTuLw1wm2XqLeuo3sxBy9aQ8L8Rzo3OGA
 +rawP9hqaI=; b=RXd1+TjQM5zvJU4unEMhW0Zof4WZIpwj06LZeoGhapKIbT5t/
 MxN7z47jJec2teAUC9WUyx7mL6rhuUV6N7Q1CsGIUs7fhBZqgBK8AF/d++TKjqiJ
 S8OWVxs5cOaANSI4RfQKwJHXmjkXVnb29G9m/T5jBAiWbkoA7uGhxFV97fOw0Mnt
 RQbLXOafytpq+Dg9xdgouo41FhBLXe3QEAzO1CfDyLmbe6dWGOOxPTexL24yfZqb
 n9wv50VMn2H6er0LdQADhishMic5KH8k2DhTdf4IecOtuiL03jnIR6GUEcocl9Vs
 CxsOI7+KSlAEt084LfUlb/v78rhx6D39UgIGA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: dts: amlogic: Fix SPI NOR flash node name for
 ODROID N2/N2+
Date: Sat, 23 Oct 2021 23:48:56 +0200
Message-Id: <20211023214856.30097-4-alexander.stein@mailbox.org>
In-Reply-To: <20211023214856.30097-1-alexander.stein@mailbox.org>
References: <20211023214856.30097-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BB8431317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_144925_900884_BE9072D2 
X-CRM114-Status: GOOD (  12.03  )
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

Fix the schema warning: "spi-flash@0: $nodename:0: 'spi-flash@0' does
 not match '^flash(@.*)?$'" from jedec,spi-nor.yaml

Fixes: a084eaf3096c ("arm64: dts: meson-g12b-odroid-n2: add SPIFC controller node")
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 6e9ff5076b38..9c05c83453f5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -611,7 +611,7 @@ &spifc {
 	pinctrl-0 = <&nor_pins>;
 	pinctrl-names = "default";
 
-	mx25u64: spi-flash@0 {
+	mx25u64: flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "mxicy,mx25u6435f", "jedec,spi-nor";
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
