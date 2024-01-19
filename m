Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57E0C47DD3
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jan 2024 07:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLsIx0wf+YaFqWyr+BiVSmDugz8rcNUeZ1rDvACUST8=; b=I11Z554AACkajG
	VgMTW1lH69UkslDVJscj2B15PPoZs52IMQMy8vTheNcg6WDzpRdS+uxFnctGpoK2o0GG0jyyt+LYG
	WBxWdeb4BBSt8NX22+9srwqsYqqKpOqIks8fEJ/wGjCbsunPPGm8xcG+Xj6HxPrnOFynptcm51X9q
	jL1JOZlvOrRm7VHWOD/8G23i/KjpCVxtV2vCwI8ZtO0YIofoj6HKQO+R/WgyTe9sldU7G4I7rdc69
	xdhXOQ5zkzPqz19Yos78vDH+1MPtvsSfkjXo2INeSaoaWzwcXnF2RFtnpvQQKkmWrh1qw9basNSaG
	SlPsUTG7lmsELur9fUSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQjb9-004kVK-1w;
	Fri, 19 Jan 2024 07:47:31 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQjb5-004kPI-1J;
	Fri, 19 Jan 2024 07:47:29 +0000
X-UUID: b295426561af4f67bc70b69a7c2ea1ee-20240119
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:c4acb646-4d71-44fb-aa5e-55f74e42c7d6,IP:20,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-INFO: VERSION:1.1.35,REQID:c4acb646-4d71-44fb-aa5e-55f74e42c7d6,IP:20,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:5
X-CID-META: VersionHash:5d391d7,CLOUDID:78f5572f-1ab8-4133-9780-81938111c800,B
	ulkID:240119154645RWLL5RGM,BulkQuantity:0,Recheck:0,SF:66|38|24|17|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: b295426561af4f67bc70b69a7c2ea1ee-20240119
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1189345623; Fri, 19 Jan 2024 15:46:42 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 3CD5BE000EB9;
	Fri, 19 Jan 2024 15:46:42 +0800 (CST)
X-ns-mid: postfix-65AA28E2-47313902
Received: from kernel.. (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 648F9E000EB9;
	Fri, 19 Jan 2024 15:46:36 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] meson-mx-socinfo: Fix possible null-pointer dereference issues in meson_mx_socinfo_init
Date: Fri, 19 Jan 2024 15:46:35 +0800
Message-Id: <20240119074635.265218-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_234727_809742_E42E1195 
X-CRM114-Status: UNSURE (   6.90  )
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

In meson_mx_socinfo_revision, kasprintf() returns a pointer
to dynamically allocated memory which can be NULL upon failure.

Similarly, the kstrdup_const in the meson_mx_socinfo_soc_id
returns a null pointer when it fails. Ensure the allocation was successful
by checking the pointer validity. Avoid null pointer dereference issues.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/soc/amlogic/meson-mx-socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/amlogic/meson-mx-socinfo.c b/drivers/soc/amlogic/meson-mx-socinfo.c
index 92125dd65f33..9c0296599561 100644
--- a/drivers/soc/amlogic/meson-mx-socinfo.c
+++ b/drivers/soc/amlogic/meson-mx-socinfo.c
@@ -160,6 +160,12 @@ static int __init meson_mx_socinfo_init(void)
 							   metal_rev);
 	soc_dev_attr->soc_id = meson_mx_socinfo_soc_id(major_ver, metal_rev);
 
+	if (!soc_dev_attr->revision || !soc_dev_attr->soc_id) {
+		kfree_const(soc_dev_attr->revision);
+		kfree_const(soc_dev_attr->soc_id);
+		kfree(soc_dev_attr);
+		return -ENOMEM;
+	}
 	soc_dev = soc_device_register(soc_dev_attr);
 	if (IS_ERR(soc_dev)) {
 		kfree_const(soc_dev_attr->revision);
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
