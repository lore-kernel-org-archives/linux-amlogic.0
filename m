Return-Path: <SRS0=DSrP=W7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC71C3A5A7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 08:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5D1922CED
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Sep 2019 08:22:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XjDy9qJP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTBHYoMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5D1922CED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dGBQL3vwoHcN2r4uERCsPVH0Mq1CZ0/uSBetj/SMkqg=; b=XjDy9qJPzz/Uaz
	OXbtMaPICa8SnGYR9sZe5YdLOnnSRzYrF/U95MSZ8TWHKLDcdnHiAG5VUelwhQx19jwr6RUeheWFB
	ZmOBHhlR9fREhYX34zs3r+c0hEtmnkNgmaEFiuXyfbqL0j8BqxC80rwzKUXomSCBBhcumofj6iWcA
	NAQiteXa3tPXBY/IfZsNDwzXXRARFo33bQObVZM5i6bkPurLTzqz0tKyQZGSL6SIsdj9OW0TigU8+
	ggWa2/BIemAWsGrSWQOgah1QYfG4kzcu1vF1OT7764uMsvTjU224TIG2kII2BOylvrOJc2A7iH0yq
	8viTNf34xJPICzK6nP0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5QYs-0002IY-BF; Wed, 04 Sep 2019 08:22:42 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5QYp-0002I7-Cc; Wed, 04 Sep 2019 08:22:40 +0000
Received: by mail-pl1-x644.google.com with SMTP id x3so4094309plr.12;
 Wed, 04 Sep 2019 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=R+MTq1VS0iR1Cmy3+6Y5RTbLGGusOaeHEDjli8lEEug=;
 b=RTBHYoMusuZZ5AhgQVW4Ifku1G8VvN4Ll0zy023Lbai0cViQEH2bR6Iui/by5YW1Ap
 Q6aYgQSGI9o/EGk+Sn2VF2wxSMZqyDRoqmknxzQNcPNtlmHeghzyeCGm/q0giQ5NFWNI
 C1HvKXxbYbV0VHTuxz6/Ip6QnSNpNZ7ZMUOImib8g8ItRoRcH8mTzwGOHTTTOy2waQ94
 nO0BsM7b0Rma+caRCrzA2ZsNaEfBYIhVnamBuZcaQOilnxF5VtbynTkCur6tN8LvjwEh
 /KdfPBtSwEEHmECBR3CasdP57gyGVdxJVcyyG2tk4EHazua53hS5K8I6uuUcqLLB9kyZ
 BY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=R+MTq1VS0iR1Cmy3+6Y5RTbLGGusOaeHEDjli8lEEug=;
 b=ZCQ4DZZOQ4fcQyKBpW7K0njqy2h2K80y2p9UhZjjQk0qR7kJor7p8UUJyLZsHMIXJq
 lYKFcqjPVlfc48wtwgqZ9kZrW0DJsfK4SOOvPfA0yPbosBdDe5BQhzEf47obrNqRJ28q
 AZzpMNOYUzJ3zekmJY8DyOeWUrgbi2JOz5/8EwZnZeuijI/rMC22rQItreUyyfTGqUSc
 03QtOzY7VT1zYAoZX70ig7c1B8NpHrnXzwC68jIphir0hSDJOIPJHWDLFGSH2YMe1W5F
 v7GICm9JalQ8DoSQeXDS853U2iYHYdHvp8/HNG7V0F2+ieION6HJalA1ZP6RKO7Gx31A
 rljA==
X-Gm-Message-State: APjAAAXr6EqbpoI4mZ0DO7oLNU/azd4RP9ugQdaIIvTNpjQ+qeMRmY2d
 tMXGN6O6l+tBsCv7W3J+VHc=
X-Google-Smtp-Source: APXvYqx1Bf1AOmUEnA9r1G5j3AiZRcryCIH6SYuoyG7V3crQWL4xyMzhyRlY+1SwI2QFZ3T3XLdMbA==
X-Received: by 2002:a17:902:8345:: with SMTP id
 z5mr41132525pln.29.1567585358436; 
 Wed, 04 Sep 2019 01:22:38 -0700 (PDT)
Received: from LGEARND20B15 ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id y8sm22025894pfe.146.2019.09.04.01.22.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Sep 2019 01:22:37 -0700 (PDT)
Date: Wed, 4 Sep 2019 17:22:32 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: mchehab@kernel.org, khilman@baylibre.com
Subject: [PATCH] media: meson: Add NULL check after the call to kmalloc()
Message-ID: <20190904082232.GA171180@LGEARND20B15>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_012239_457756_426E4B8D 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
Cc: mjourdan@baylibre.com, devel@driverdev.osuosl.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If the kmalloc() return NULL, the NULL pointer dereference will occur.
	new_ts->ts = ts;

Add exception check after the call to kmalloc() is made.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index f16948b..e7e56d5 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -206,6 +206,10 @@ void amvdec_add_ts_reorder(struct amvdec_session *sess, u64 ts, u32 offset)
 	unsigned long flags;
 
 	new_ts = kmalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts) {
+		dev_err(sess->core->dev, "Failed to kmalloc()\n");
+		return;
+	}
 	new_ts->ts = ts;
 	new_ts->offset = offset;
 
-- 
2.6.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
