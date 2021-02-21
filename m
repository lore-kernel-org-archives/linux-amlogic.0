Return-Path: <SRS0=dtw9=HX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A2BC433E0
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Feb 2021 15:30:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5BE64EF1
	for <linux-amlogic@archiver.kernel.org>; Sun, 21 Feb 2021 15:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5BE64EF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fgRoQ6HxM0g68CU41DNbDDRaQxGlmpd6qtmwlaDqjvg=; b=G27ivSlzv3zBwgOIK4ze0Q3pJZ
	b21dnzKDzy8kij7QmGHuraFvTyBa5w7fy5u9xkQCxIewd+i3HdG2UursPr1RWro3MdEoxcECL2eAf
	51tr0X5mXW0MWbjIPWMYDmoOtZuF993R1Z/hJTMSZPx7utpBGUVZjJkybALhVx+c9wPzWw0CLeJum
	+nWTvGeIfYLDIBr9JbmI/VN2F49n+HHLQMAjowyO9JpAg8+KbwP29WBmUbQ7owNvpSyoDTTRFrCBx
	Csm5Sj1MtxyeIqac55xzOrgq/5CkaKPvSk8L9t0SPzgdmvBPMu4OE98AsuH8hbQscTLKt7RLGqTtB
	crDJwZ6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lDqgt-00075U-KI; Sun, 21 Feb 2021 15:30:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lDqgr-00074y-JL; Sun, 21 Feb 2021 15:30:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62FA664EEF;
 Sun, 21 Feb 2021 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613921431;
 bh=O9xlPGiejTlK8aa43y0xsYCFghq5BZtPdRfRU4PePuY=;
 h=From:To:Subject:Date:From;
 b=Dn2ff16+PkGl2Jcm8JDnI4a16EOK+VRAilHMxwxScAZCTufG9SNFVwMlmQmRuCnZT
 fUjJcb5Eyye4dwMVSLLVoRzH29wyh6QcKgdWkND7+wpl1kF9ruLeLmPBzk5AwqbT63
 z8x2bcnw624KdCfPVq9VoAuF8pJFLUYmTz1Aw3FTA1jshi41EZlAXkZk8aC/JAU3pU
 6H5kriL6l4uL4I1D/Ge2Aq/naELHUmWKie5O0S/PdP4dA8cRomcsP5SQWtPDORsoRF
 sZ6za2fIl+/ehickYhTY1YghnlhWDxNCbccZczdTfYNb/+X9z21HvQTGBwo4FJ+Yrg
 Kya+3+dUaGIqQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH] ASoC: constify of_phandle_args in snd_soc_get_dai_name()
Date: Sun, 21 Feb 2021 16:30:24 +0100
Message-Id: <20210221153024.453583-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210221_103033_798700_7F02678E 
X-CRM114-Status: GOOD (  12.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The pointer to of_phandle_args passed to snd_soc_get_dai_name() and
of_xlate_dai_name() implementations is not modified.  Since it is being
used only to translate passed OF node to a DAI name, it should not be
modified, so mark it as const for correctness and safer code.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/sound/soc-component.h     | 4 ++--
 include/sound/soc.h               | 2 +-
 sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
 sound/soc/meson/aiu-codec-ctrl.c  | 2 +-
 sound/soc/meson/aiu.c             | 4 ++--
 sound/soc/meson/aiu.h             | 2 +-
 sound/soc/qcom/lpass-cpu.c        | 2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c  | 2 +-
 sound/soc/soc-component.c         | 2 +-
 sound/soc/soc-core.c              | 2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5b47768222b7..7dc75b39287f 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -101,7 +101,7 @@ struct snd_soc_component_driver {
 
 	/* DT */
 	int (*of_xlate_dai_name)(struct snd_soc_component *component,
-				 struct of_phandle_args *args,
+				 const struct of_phandle_args *args,
 				 const char **dai_name);
 	int (*of_xlate_dai_id)(struct snd_soc_component *comment,
 			       struct device_node *endpoint);
@@ -450,7 +450,7 @@ void snd_soc_component_remove(struct snd_soc_component *component);
 int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 				      struct device_node *ep);
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
-					struct of_phandle_args *args,
+					const struct of_phandle_args *args,
 					const char **dai_name);
 int snd_soc_component_compr_open(struct snd_compr_stream *cstream);
 void snd_soc_component_compr_free(struct snd_compr_stream *cstream,
diff --git a/include/sound/soc.h b/include/sound/soc.h
index bd38015d6c6d..78609ab331c8 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1219,7 +1219,7 @@ unsigned int snd_soc_of_parse_daifmt(struct device_node *np,
 				     struct device_node **bitclkmaster,
 				     struct device_node **framemaster);
 int snd_soc_get_dai_id(struct device_node *ep);
-int snd_soc_get_dai_name(struct of_phandle_args *args,
+int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
 int snd_soc_of_get_dai_name(struct device_node *of_node,
 			    const char **dai_name);
diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 7078197e0cc5..27a6d3259c50 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -159,7 +159,7 @@ static const struct snd_kcontrol_new aiu_acodec_ctrl_controls[] = {
 };
 
 static int aiu_acodec_of_xlate_dai_name(struct snd_soc_component *component,
-					struct of_phandle_args *args,
+					const struct of_phandle_args *args,
 					const char **dai_name)
 {
 	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_ACODEC);
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 4b773d3e8b07..c3ea733fce91 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -125,7 +125,7 @@ static const struct snd_soc_dapm_route aiu_hdmi_ctrl_routes[] = {
 };
 
 static int aiu_hdmi_of_xlate_dai_name(struct snd_soc_component *component,
-				      struct of_phandle_args *args,
+				      const struct of_phandle_args *args,
 				      const char **dai_name)
 {
 	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_HDMI);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index dc35ca79021c..ba15d5762b0b 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -42,7 +42,7 @@ static const struct snd_soc_dapm_route aiu_cpu_dapm_routes[] = {
 };
 
 int aiu_of_xlate_dai_name(struct snd_soc_component *component,
-			  struct of_phandle_args *args,
+			  const struct of_phandle_args *args,
 			  const char **dai_name,
 			  unsigned int component_id)
 {
@@ -72,7 +72,7 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 }
 
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
-				     struct of_phandle_args *args,
+				     const struct of_phandle_args *args,
 				     const char **dai_name)
 {
 	return aiu_of_xlate_dai_name(component, args, dai_name, AIU_CPU);
diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
index 87aa19ac4af3..393b6c2307e4 100644
--- a/sound/soc/meson/aiu.h
+++ b/sound/soc/meson/aiu.h
@@ -45,7 +45,7 @@ struct aiu {
 		     SNDRV_PCM_FMTBIT_S24_LE)
 
 int aiu_of_xlate_dai_name(struct snd_soc_component *component,
-			  struct of_phandle_args *args,
+			  const struct of_phandle_args *args,
 			  const char **dai_name,
 			  unsigned int component_id);
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index c642e5f8f28c..4762286b33fe 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -340,7 +340,7 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_probe);
 
 static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
-				   struct of_phandle_args *args,
+				   const struct of_phandle_args *args,
 				   const char **dai_name)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index 4e1f101281e7..e8915519f427 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1315,7 +1315,7 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 };
 
 static int q6afe_of_xlate_dai_name(struct snd_soc_component *component,
-				   struct of_phandle_args *args,
+				   const struct of_phandle_args *args,
 				   const char **dai_name)
 {
 	int id = args->args[0];
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 159bf88b9f8c..8415e9bd2932 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -370,7 +370,7 @@ int snd_soc_component_of_xlate_dai_id(struct snd_soc_component *component,
 }
 
 int snd_soc_component_of_xlate_dai_name(struct snd_soc_component *component,
-					struct of_phandle_args *args,
+					const struct of_phandle_args *args,
 					const char **dai_name)
 {
 	if (component->driver->of_xlate_dai_name)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f6d4e99b590c..50190654edda 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2994,7 +2994,7 @@ int snd_soc_get_dai_id(struct device_node *ep)
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_id);
 
-int snd_soc_get_dai_name(struct of_phandle_args *args,
+int snd_soc_get_dai_name(const struct of_phandle_args *args,
 				const char **dai_name)
 {
 	struct snd_soc_component *pos;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
