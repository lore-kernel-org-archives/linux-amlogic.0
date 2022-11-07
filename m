Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FA2C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Krf6xYlrQrn6OJqmrI2foEw0i240HckiD4eB9ZSg4p0=; b=ufXk/ZW+bqGuB3
	frPJlD1vV80vigSvthH2yfQuNm6c55drXkkvOchKRSeiJm3hgTh6T/TEH0kTO804XLGQ7JFrVUPO3
	G3s8qK8MDPnzXG99xY75oRy5VDEXTXzjSrXDXqY/6WnsFVVWNMeg3y68mNK+3BFHy61j+JiR+d5Sh
	X9hzSp1Id/XEcANhTYPPGvDQZOGWUhb0atj+B4YmcXAggOWeD3HditWtV/8zBNoQNtektbEB8Anm8
	gKBWVSor8Q5VPpjWCEj2V1R0yybyLhL1vOy6tHJEbQVd/6SddOoJi/5QtJECeQCql/W22vyUeQMju
	S0zlUBBQbOh+GldgkvTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7YF-00HV0M-3h; Mon, 07 Nov 2022 19:12:55 +0000
Received: from msg-4.mailo.com ([213.182.54.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7X1-00HTkT-By; Mon, 07 Nov 2022 19:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667848286; bh=zWPAdToNUDwcfw6NFyLWvfacA3nb38cKYkYp0UwSEe0=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=e+EjilvWCDu3GYPl50nMRQcJ3YfC61qnAQ4TnVjjx9VnoXN24iJaw3EzlJducIw1D
	 i6AEctOqf2gK+tJ9k+Xw0xko7kxtxBsfXFE4Mqpsf/K4wgZfi8KArDvWNiumosR/RJ
	 5aviiZDV4Xa83JS+xV+AkT7XZEKbnnM39F4sAiAc=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Mon,  7 Nov 2022 20:11:26 +0100 (CET)
X-EA-Auth: lhzqnxlKSukeYTArdeiVEjBhxUlWR9klVoDlFhWy14zVU6h0rU481r3lcJJeuxpO45fLMz+oj+pcg6mqQVqZdCkKc6VHGZrj
Date: Tue, 8 Nov 2022 00:41:21 +0530
From: Deepak R Varma <drv@mailo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: meson: vdec: use min() for comparison and
 assignment
Message-ID: <Y2lYWWKkDa73gcqm@qemulion>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_111139_566740_8FDB8AC5 
X-CRM114-Status: GOOD (  10.42  )
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

Use of standard min() helper macro is preferred over using ternary
operator for logical evaluation and value assignment. This issue is
identified by coccicheck using the minmax.cocci file.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/media/meson/vdec/codec_vp9.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_vp9.c b/drivers/staging/media/meson/vdec/codec_vp9.c
index 897f5d7a6aad..da7265c8de37 100644
--- a/drivers/staging/media/meson/vdec/codec_vp9.c
+++ b/drivers/staging/media/meson/vdec/codec_vp9.c
@@ -1459,7 +1459,7 @@ static void vp9_tree_merge_probs(unsigned int *prev_prob,
 	if (den == 0) {
 		new_prob = pre_prob;
 	} else {
-		m_count = den < MODE_MV_COUNT_SAT ? den : MODE_MV_COUNT_SAT;
+		m_count = min(den, MODE_MV_COUNT_SAT);
 		get_prob =
 			clip_prob(div_r32(((int64_t)tree_left * 256 +
 					   (den >> 1)),
@@ -1513,7 +1513,7 @@ static void adapt_coef_probs_cxt(unsigned int *prev_prob,
 			/* get binary prob */
 			num = branch_ct[node][0];
 			den = branch_ct[node][0] + branch_ct[node][1];
-			m_count = den < count_sat ? den : count_sat;
+			m_count = min(den, count_sat);

 			get_prob = (den == 0) ?
 					128u :
@@ -1664,8 +1664,7 @@ static void adapt_coef_probs(int prev_kf, int cur_kf, int pre_fc,
 			if (den == 0) {
 				new_prob = pre_prob;
 			} else {
-				m_count = den < MODE_MV_COUNT_SAT ?
-						den : MODE_MV_COUNT_SAT;
+				m_count = min(den, MODE_MV_COUNT_SAT);
 				get_prob =
 				clip_prob(div_r32(((int64_t)
 					count[coef_count_node_start] * 256 +
--
2.34.1




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
