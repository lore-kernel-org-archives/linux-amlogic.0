Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09318C3065A
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Jul 2024 19:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8Lj4Aov3X0LUyfsiQvLDc2UsSoJJM7BKVmFsZ0aUyE=; b=c5acLZ0fFykTvd
	mtSjb9+DYlmzgadNogyDupdvk9JHIb8keJySJjJ/mtASR3wr1iQI14bRr//2ugxUcdDnmZqt8TlDq
	U8MQUuDbsQZ4jG65rNBoyJviPe7tjku1fO2DOOb9Q6HN3pdHs4Lf3GP/8UmiI0i3Kg212zX03v5YC
	03OaMFWgjm4KHjKTP1YRQiemh60Fh7qA1pq21nJCp/FSeQpuh/pbLpASeEKQiqqEIs2SV72qM2GCj
	iZBWWicqV+n2Xu4TTqYWaIXWZFG58nHeYEB/UFvSsPFJRF8pm+2UpNJ0KsjKkOgb+g1/XSLDywOaW
	sIXJRXjWpypX3gmJMQiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sON5j-00000004hNr-1U2T;
	Mon, 01 Jul 2024 19:53:35 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sON5g-00000004hMf-3cBI;
	Mon, 01 Jul 2024 19:53:34 +0000
Received: from fedora.. ([77.131.3.81])
	by smtp.orange.fr with ESMTPA
	id ON5TsnKqM3PPAON5UsfK1q; Mon, 01 Jul 2024 21:53:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1719863602;
	bh=vMCou+9uf+uUUkz293F72Wo3DfglK/VKpyr7CR/9w3U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=NXYBi3ruSXep/nOHyr+39Y8bVRoQF5zRRgVKeRE8wLAKdSURmXLuOLqLtoeEsboPF
	 N6AsQOovL4wUDg0jNvKE9klGF1eYYaBC2KRGO/smC/Hb6FvGLz5EK5yHT/bSb+yTls
	 nbKfFEjqfavg8m0Q41i7KL/YmYOBR2ImU/8Kjf2xBFvmkSa76Acd78iwQAdknj5DGE
	 cadz5geCbOHj4IvlYkiib9bSlNicnSZfNZdKjFgROt3FJCOc4waI9wKcetGq4sP+d5
	 GKh/MQ7jM1gU1YkbNk8k6s4xFG5gbus7a+L/JktoNlPL+x7WF0J0dENDlY1td0OtV5
	 ixu41dYZWgGPA==
X-ME-Helo: fedora..
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jul 2024 21:53:22 +0200
X-ME-IP: 77.131.3.81
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] pmdomain: amlogic: Constify struct meson_secure_pwrc_domain_desc
Date: Mon,  1 Jul 2024 21:53:16 +0200
Message-ID: <871d6b708de8bb42e1fabd8a601dc9a9a217cf00.1719863475.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_125333_063079_0BD322DC 
X-CRM114-Status: GOOD (  13.62  )
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

'struct meson_secure_pwrc_domain_desc' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   4909	   4072	      0	   8981	   2315	drivers/pmdomain/amlogic/meson-secure-pwrc.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   8605	    392	      0	   8997	   2325	drivers/pmdomain/amlogic/meson-secure-pwrc.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only.

The .is_off() function is *always* set as pwrc_secure_is_off(), so it could
make sense to remove this function pointer and call pwrc_secure_is_off()
directly when needed.
This would save some memory and useless indirection.

I leave it as-is because it is maybe here for future use.
---
 drivers/pmdomain/amlogic/meson-secure-pwrc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/amlogic/meson-secure-pwrc.c b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
index df5567418226..62857482f874 100644
--- a/drivers/pmdomain/amlogic/meson-secure-pwrc.c
+++ b/drivers/pmdomain/amlogic/meson-secure-pwrc.c
@@ -46,7 +46,7 @@ struct meson_secure_pwrc_domain_desc {
 
 struct meson_secure_pwrc_domain_data {
 	unsigned int count;
-	struct meson_secure_pwrc_domain_desc *domains;
+	const struct meson_secure_pwrc_domain_desc *domains;
 };
 
 static bool pwrc_secure_is_off(struct meson_secure_pwrc_domain *pwrc_domain)
@@ -110,7 +110,7 @@ static int meson_secure_pwrc_on(struct generic_pm_domain *domain)
 	.parent = __parent,			\
 }
 
-static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
+static const struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(DSPA,	0),
 	SEC_PD(DSPB,	0),
 	/* UART should keep working in ATF after suspend and before resume */
@@ -137,7 +137,7 @@ static struct meson_secure_pwrc_domain_desc a1_pwrc_domains[] = {
 	SEC_PD(RSA,	0),
 };
 
-static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
+static const struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
 	SEC_PD(A4_AUDIO,	0),
 	SEC_PD(A4_SDIOA,	0),
 	SEC_PD(A4_EMMC,	0),
@@ -155,7 +155,7 @@ static struct meson_secure_pwrc_domain_desc a4_pwrc_domains[] = {
 	SEC_PD(A4_AO_IR,	GENPD_FLAG_ALWAYS_ON),
 };
 
-static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
+static const struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
 	SEC_PD(C3_NNA,		0),
 	SEC_PD(C3_AUDIO,	0),
 	SEC_PD(C3_SDIOA,	0),
@@ -172,7 +172,7 @@ static struct meson_secure_pwrc_domain_desc c3_pwrc_domains[] = {
 	SEC_PD(C3_VCODEC,	0),
 };
 
-static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
+static const struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_DOS_HEVC,	0),
 	SEC_PD(S4_DOS_VDEC,	0),
 	SEC_PD(S4_VPU_HDMI,	0),
@@ -184,7 +184,7 @@ static struct meson_secure_pwrc_domain_desc s4_pwrc_domains[] = {
 	SEC_PD(S4_AUDIO,	0),
 };
 
-static struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
+static const struct meson_secure_pwrc_domain_desc t7_pwrc_domains[] = {
 	SEC_PD(T7_DSPA,		0),
 	SEC_PD(T7_DSPB,		0),
 	TOP_PD(T7_DOS_HCODEC,	0, PWRC_T7_NIC3_ID),
-- 
2.45.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
