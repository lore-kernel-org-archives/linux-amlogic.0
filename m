Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05086C47079
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6Wh5nnJ684UzT2gTrIOSo+qvVsM0orOtVCYqDGaCMg=; b=NDXYEmy4x34QRy
	f7iK1SKbtgnzY2KKw+PnrEK99gH3boV3Bnh4+/E6x0fKr443O5/EvZNbu3lO4iDgxvlbj2zjQuHeM
	I4LNcVPe2jlso4gAsEXLVP05M2UyXmxKk/LkjTq1fAt2akwldtWJ/vH3CByBrxxJGBn9jgf/jiVs8
	zTgnRgD5SJOlh6Jz+LLDpZwGCFIhozZ1fOjmBRs9StbBe12hG2dhnaMTXreP+FNC6haZzXKmOVI/i
	5c2dKAgHlV7/NUdk2ocmA9Jqt49Jnipkh8wkSSZjj1w9gX0RdWxz1IXwG7yYFlD1FURkAiqYRA3G1
	x8ifpXTcy+WFO0nncMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL65f-00Bmad-2W;
	Wed, 03 Jan 2024 18:35:43 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL64P-00Bl1M-0W;
	Wed, 03 Jan 2024 18:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3EE98CE17CE;
	Wed,  3 Jan 2024 18:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F4AC433C9;
	Wed,  3 Jan 2024 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306862;
	bh=B8zEDu24iYdp1D2IrkF5R6n4WctFQW7jsiGp+pgfOHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ScqQ1wbJ3FvcTR5o42OpxWXCzjmH8WNSCarXDvdJtHKsM2z3W0Meg+6j2KZYv2hm7
	 qAaKXIZWc9I3+xeQidVnuVuUdmjFvmFlh9f/IRVmdK9wcnFnW0ArT1ugku+A7UHYg/
	 Z6RWW87M/tqjkXVmHT6P3O6YHsMElKIIv8/A6yPjZ11VKFQ3MBkpLkr5jTXCkwmDiw
	 mX+B/iy/Vkr2QNaMzBTq3e1gD5e867Wj/OmEz6hsZ0ufvDNxw51t4IF+70S48yOeEW
	 WZHqFKWCp2CRYCdO89AEo4U1SRSzD2Nig4kDQr1SYxDUor7lNrkV6K6k0ySy+v+01J
	 vX9kPK2uDnVPw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:01 +0000
Subject: [PATCH 1/4] ASoC: meson: g12a-toacodec: Validate written enum
 values
MIME-Version: 1.0
Message-Id: <20240103-meson-enum-val-v1-1-424af7a8fb91@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=broonie@kernel.org;
 h=from:subject:message-id; bh=B8zEDu24iYdp1D2IrkF5R6n4WctFQW7jsiGp+pgfOHU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllailRF53dP8BdcNiiucMBNUWe0Bfoinwza+iA
 k98eb/reiGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopQAKCRAk1otyXVSH
 0J+sB/95RlpkPTF9f6yzkpbHjBnF6rgqjyIkO2/GedEUoAPrGm0/781noJTYbc7sQG5WpiIxj9e
 E4B+MYv4ymaHspYZAVcllMJNkQlWoxVjlbYiiqGjmxRUffo6ZgnpFx4HJN4U9tSlE1sqZRQzvve
 V51inkIIr+SN/3fenEt3m+oll5VDH1teYdTpVvOtQtqDg6XGaVjnsuddjVf7ftLTzJUq0jO6Ylt
 xCHAz8NV8eA2+bgm2opWls1lXCerybpxAVwIPme9Pgl5NIs6uQBsb9b4+Jm3U6HDi4yUVLwPMKG
 EaK4IcbPFDe02qyInmnJPfvPRqJUsRbmTh6cfiDHXxNe90Ng
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_103425_389073_9502E740 
X-CRM114-Status: GOOD (  11.19  )
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

Fixes: af2618a2eee8 ("ASoC: meson: g12a: add internal DAC glue driver")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-toacodec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index 6c4503766fdc..dd7f07de2685 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -71,6 +71,9 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, reg;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	regmap_field_read(priv->field_dat_sel, &reg);
 

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
