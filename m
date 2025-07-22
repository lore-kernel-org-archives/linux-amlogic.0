Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD850C83F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jul 2025 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5NAO0E1PAXamWlQvHz+WZzRcA0LMq0nPXeN5rfYK3bo=; b=CpGa5/PlyTv94e
	a6D2g1zvwW3ssFUu3MtL25I2BBrzMaSokIVlfqnVrLUXjipcBTWP3JWR8gKG1Rs6f803UfUso/Cmk
	A2+Xwor8UWomwEMM64ft5AhaXoJ0TqjFHK4vjtMeA3UF9GtxtvvQigy1guycw3zzzXHkJzIr01etD
	IVtSK4JdgVGqt1HBRGJ12+zSOam6cHLnySn8CkkmS0LLpVY2Yn7SmVLL6QWN03XRhC68v++nPNq+8
	4YO6yrxuklDjX34uoL2Bn5/KeSz66PF//8nbvGMrBpgaiDMuwLKLyDV5cP5aTKoKwN4ZxkkvWrlJ/
	qri9quAEhGAhIcBGwI8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBRE-00000002KL7-0Ehf;
	Tue, 22 Jul 2025 11:45:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueBCs-00000002I3j-2D4j
	for linux-amlogic@lists.infradead.org;
	Tue, 22 Jul 2025 11:30:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EB06743B06;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9DBBC4CEEB;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753183849;
	bh=TK9EYYruh2F06Jrfhx9PUGH3rMdXnLUpiSRSNrwKVTA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XQr+DWFJL/Xdw2blAlg/cgn9xTKY6/UMIcBc+FzpfH4AHDpkcww26bu0ScnCDNnlx
	 ahSgxHZAVV+yKalhBqcXcYDgDPZsd7zFQJD94aW7x3wsEy7M51tiPqPNcg/xYIoKt+
	 RGcMmSSHfSbgqKEsGXQQZkkAC1xFRLqi+5FRpyBpRSFfZufIQ7FGH7VxTd1ElaKSlI
	 mZsnRExo8qY2993ipVvCs+zix2BSuAXq/DpeoWBrZSi6ZaR0IzsSSgm31cAGcFodow
	 1igMfxJ7SQyopKX3zwfj7JBszE4RqeQwS74BpZAH+yNRu6/5//kO7iiuZVqH6cz874
	 ZPiDiQAGsY61w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99C7C83F1A;
	Tue, 22 Jul 2025 11:30:49 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 22 Jul 2025 19:30:48 +0800
Subject: [PATCH v2] rtc: amlogic-a4: Optimize global variables
MIME-Version: 1.0
Message-Id: <20250722-rtc-regmap-v2-1-58bc17187a11@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAGd2f2gC/23MQQ7CIBCF4as0sxYDVMV25T1MF0CndBIpDTRE0
 3B3sWuX/0vet0PCSJigb3aImClRWGrIUwN21otDRmNtkFxeuRKKxc2yiM7rlYkLR2zvRplJQT2
 sESd6H9hzqD1T2kL8HHYWv/UvkwUTTI+iU+3NWsO7h/av4MiebfAwlFK+9U/PgqYAAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753183848; l=1493;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=9dM7dYiSAIYeWx8dG0E9yLzdI2cirE8OM6/rYACd5eg=;
 b=tn0iCa4/fCE+b5om7zwj5nHT9XwVZ+HF0aeqTeNuyh4Iwxx4lPfDBh6ojC8BzTqjKxGyEf9oT
 hd+6OIsagGNCQt1jqbiC+ZBDzTD3FgftuTHRbqZVx5rBRlSu1QFtB3K
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_043050_595726_CB8B0FA3 
X-CRM114-Status: GOOD (  11.00  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Convert a global variable into a local one of aml_rtc_probe().

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Convert a global variable into a local one of aml_rtc_probe().
---
Changes in v2:
- Modify the submission description.
- Link to v1: https://lore.kernel.org/r/20250717-rtc-regmap-v1-1-ad19736ccb09@amlogic.com
---
 drivers/rtc/rtc-amlogic-a4.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-amlogic-a4.c b/drivers/rtc/rtc-amlogic-a4.c
index 09d78c2cc691..1928b29c1045 100644
--- a/drivers/rtc/rtc-amlogic-a4.c
+++ b/drivers/rtc/rtc-amlogic-a4.c
@@ -72,13 +72,6 @@ struct aml_rtc_data {
 	const struct aml_rtc_config *config;
 };
 
-static const struct regmap_config aml_rtc_regmap_config = {
-	.reg_bits = 32,
-	.val_bits = 32,
-	.reg_stride = 4,
-	.max_register = RTC_REAL_TIME,
-};
-
 static inline u32 gray_to_binary(u32 gray)
 {
 	u32 bcd = gray;
@@ -328,6 +321,13 @@ static int aml_rtc_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int ret = 0;
 
+	const struct regmap_config aml_rtc_regmap_config = {
+		.reg_bits = 32,
+		.val_bits = 32,
+		.reg_stride = 4,
+		.max_register = RTC_REAL_TIME,
+	};
+
 	rtc = devm_kzalloc(dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;

---
base-commit: 0bafe291cb429d39b5ff70bcf7b2f3ab026dcb02
change-id: 20250717-rtc-regmap-140ee38b7bf7

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
