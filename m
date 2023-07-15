Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE44EB64DC
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 14:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qiejE9EvF5GVs0qIPLz2TaLCkdDRf4pNCl6lTmpO9J8=; b=k7J3NDKXyWWh1y
	WDXShj/gwGoqWGuy2naoN/kiywHK73ZYuTMEh/577V3gnyk67JtG7AIb0c3Nhxg4F2Ja9fu++NzvF
	5XfQKOpeGgysLmWRtgx1VPIcOkEgWuLcgBbY7w6cPnimMnQ9ALyhvZpjzAYWPEkiCRCzTvNoOxKGL
	VbX9xQXlh9KFEs/RJwNMuE+Fit5kI1AFd4DbPfFd435jJlBA+fdC0K0cMUYnc7/m4TSiKfqgXhcju
	xf+VyGGoLT6CZ5XnPcQo8ov/9YdlL7mItMKmAk9D2vUNLcTs0DRpun1fsDBR0r7EQcY1rNpl6bp8h
	81wlNZAxja1dxwMNieDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKg75-008wEe-2Z;
	Sat, 15 Jul 2023 14:19:11 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKg72-008wDZ-16;
	Sat, 15 Jul 2023 14:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1689430423;
	bh=xGxK1cvW6cOfjTu72horDhpvMVkb2N176vRYgCiWWTw=;
	h=From:To:Cc:Subject:Date;
	b=ElNVIl7reL2c/2TriQPekLj2i1S+H/5LH+fM33hQeDf1SobddXq4FQFVF5Im/hSzr
	 lmvDZbcSCU9XttH8gVBgBnaj2v166vliXVcZ8UxCNdbUMSq5gmu41msvm/3bg48Fwa
	 dsh8xHNUf+1NSzgHvnuT+Fh0vjOkoHflpBuchuL8=
Received: from KernelDevBox.byted.org ([180.184.51.142])
	by newxmesmtplogicsvrszb1-0.qq.com (NewEsmtp) with SMTP
	id 368194FD; Sat, 15 Jul 2023 22:13:40 +0800
X-QQ-mid: xmsmtpt1689430420t5nfc4db9
Message-ID: <tencent_AA08AAA6C4F34D53ADCE962E188A879B8206@qq.com>
X-QQ-XMAILINFO: MRkw0hrPPfAMGBCrk+wMJiM6ioZMtsRfOcVM8cXdTQ9IkavRTQokoDr3blTQfV
	 IhEZErFL/DWasE8t+6zohgoEZk95Yy6UtvX3qvY8BzarLybQ6QILWTNtxIPJEbXpDEJkGBkoFunv
	 ividpbyYfuQ6gVJe4wM1239yFovMPL0221HD5jlLMs0zbLQyIe2HyacD67f+jFotvXkAiLrOKPL3
	 4xf6F/X5GX3Z2pBcbAyyjyCgvbCOP3B62EaAkSCUJrEea8BSitgxr4jNBeYh905IpEgI7p6mV5tU
	 uYpKW0iFKVwN7fCV29nNdNmy7kc6qLAJOPpgro4PabmqD1Agrkj5wbtoge4kfht6dLmnzuryQ0Zb
	 vU9IIzHv7BXzQAY9CatezT5RmFJsBcVfLssUtd8QF2ZEeGQfe4rPTjNq9QFMt80r9watp68RV+Zc
	 byxFMivaGaMglOJFkm5598Eg5gLlpx64UbqZsyptd58uWbLWAeRhOcT4HriR6zrRtFodu9z3Cu+R
	 8tRs0ISCL332Ews4hAzkaRrjJb2tpNnVtR+nOIMk7IvKH4ZQQN9J0n4EK3Q6XfxuabSegLHCYwXW
	 8vmpgnchvVQNXXCzusJ3LCApL1N4qUsNeipZf4YkLm76n1/rFyeyMkXLlXy2OeM+TOpFCkNHqTWw
	 +FkiJXcb9S6M+QeyHj+pzujfwdMR5nlFqB1oUJoLLmgD2lFZ+FAfwfhACbH4vA5L+0Hey4jkoo4m
	 /wehFtHjFC5RgZIFbEFVVXYqp3xF2RsQt/og6Qt/FsE6F+YeHdku9hrJZ2Tl7SIzo2YBcXSGVi8p
	 g9O7RLDM//zsQhRtIlSVQ9F76GuIf/dUZ3wCtFFgrXdnKOK2PqybeLRvZWFNjlPV2jkjs4C5+oga
	 hOWgZwKlVoZ/nCv4YDRXekg7SYKTOtH5qgH8rKZazpkhXpvzT4xgZs2idmkk3xoturWAw10dKSGm
	 vPdu137X3a+CJJS2WrXYl6DHqawL0ZPYWsLkohhKONRRUq3pDpGgWs1ms/P4cdVYWheLvSV1ABZW
	 ynI+vZn8/qjkyOnl4/
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: neil.armstrong@linaro.org
Cc: khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] firmware: meson_sm: fix to avoid potential NULL pointer dereference
Date: Sat, 15 Jul 2023 22:13:38 +0800
X-OQ-MSGID: <20230715141338.1895496-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_071908_705411_60D8C101 
X-CRM114-Status: UNSURE (   8.32  )
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

of_match_device() may fail and returns a NULL pointer.

Fix this by checking the return value of of_match_device.

Fixes: 8cde3c2153e8 ("firmware: meson_sm: Rework driver as a proper platform driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/firmware/meson/meson_sm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 798bcdb05d84..9a2656d73600 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -292,6 +292,8 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	chip = of_match_device(meson_sm_ids, dev)->data;
+	if (!chip)
+		return -EINVAL;
 
 	if (chip->cmd_shmem_in_base) {
 		fw->sm_shmem_in_base = meson_sm_map_shmem(chip->cmd_shmem_in_base,
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
