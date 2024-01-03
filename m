Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED92C3DA6E
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8j+nZj18zIGqBAFsRixjd7/GXwWrP5YkULj8AkhHqI=; b=zoTIMHQ88W09J3
	n/0NulHQIWT7vVwy/wAG/hy9I/m0ys1rhscMDPbZbx5AKnsH3tO0YKAgpnF0EOaliNKjgnt8FxSlu
	/3LWa6oQIWB9Qts5sKgb/ahRs4pQz+jSJM0ypOwl7hPziNxgRG2iqyFjstN6tgEq41ondnfrk/Uj7
	VsxpYV2B+pYVKPGdI9R90CGGqGb/sMwTJ70AMwByxQHMTi5UG5GutFqxo/8s/8e2gWHYJOa7zdY09
	aweRl8pCSWABsqj5lFNJrnmYumScsskkK0C8bFQb/RP+C1pYYrd04nTRJge3b9dBrP03XqUX3vJy6
	v1RzibVx/IECoL+guVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL65i-00BmdF-0F;
	Wed, 03 Jan 2024 18:35:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL64S-00Bl5B-03;
	Wed, 03 Jan 2024 18:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7B5F0B8149C;
	Wed,  3 Jan 2024 18:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B1D6C433C7;
	Wed,  3 Jan 2024 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306866;
	bh=ht4f2L9VNRd0Mc59eoD5YHto4h+iXotwSN2zcCeCmUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gbzXcl7BbbxtSm8Gi1Qyxsl/niVlUDQwNiiEc5sY9rVMtZrwQt5V+HfUcHTM0wYTG
	 k1x+KtfvTL73UBFGoc7AL2u3mwNEoOfZyLrjEL1QqlK93Rad0S9Rh2WfszzNejvDDl
	 5ne7Eztu0D6MMIbo9CJnVEfXV37s0HjDsHd0tJUoMAcR4x4s/1qzP/1BlmFe9QeRry
	 8xDSYJviEHcCfjvIzT+kWLc065GmGQmtQTRD+Z853G+MljPQdC57+2ihRrqy7O2Y27
	 BLLdtcNI1tQ7/iyjvNm9Bjpi/xVZPPoN1OVXSHPu4MX47rPbyJQSH0Vc+lAHIhz9JC
	 rEkCyZZhEb/jQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:02 +0000
Subject: [PATCH 2/4] ASoC: meson: g12a-tohdmitx: Validate written enum
 values
MIME-Version: 1.0
Message-Id: <20240103-meson-enum-val-v1-2-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ht4f2L9VNRd0Mc59eoD5YHto4h+iXotwSN2zcCeCmUg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllaimMWacGtC/oM+FCVutaQUzoegKMoiH8Pk8W
 Wbk4bW3T96JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopgAKCRAk1otyXVSH
 0DSyB/9+01n+37YTh84CduFEZq2Oj/ZWKuKbVubO9Xv9hSbfjLZ6hv+BbHfmTJbr5Hna2XehzGw
 kfhV5m5JcRciYD7N8OTUgKgV36fi+AdE9buDprljnRf7DsyHosNHxmxVRXwZtwMToJmj/V2DV5z
 bmCkAUJD7HZ/r7KOYAWncYQk6YEjFBGAO37eagiVkwBEpcsD4QKdnkcfPUEU7rjXL7JcLJKRMsi
 VGDdgmOlqjnHOJzJkkzupjsFvYhWjZPWXjR3NOxFDwQ5MGLIWmnNy++naYdz687laZc20LzB7EL
 KRlifhoDqlOaXFnwTsGK5ULqE59CrKOJM8v4OQe3GaSuqost
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_103428_367727_CA9D93E1 
X-CRM114-Status: GOOD (  10.93  )
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

When writing to an enum we need to verify that the value written is valid
for the enumeration, the helper function snd_soc_item_enum_to_val() doesn't
do it since it needs to return an unsigned (and in any case we'd need to
check the return value).

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index f7ef9aa1eed8..51b7703e1834 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -45,6 +45,9 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL0_I2S_DAT_SEL,
@@ -93,6 +96,9 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, TOHDMITX_CTRL0,
 					      CTRL0_SPDIF_SEL,

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
