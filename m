Return-Path: <SRS0=woOx=QK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A09C169C4
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Feb 2019 11:54:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC77B21773
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 Feb 2019 11:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EBRvT9Zn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvQgmXib"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC77B21773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=tOOGp5mny9nqd+bPt8WAOzH6dXPiZL+Y3p3aRNDYnw4=; b=EBR
	vT9Zn1SzWfOJd3QjMsJuWRMDGp+RBgV1WtfeG97zHtIihVSwRjJU5zhGEgUn/y4m261/m8eW0GIId
	hyaPH3I9u4impBpswHyKZG/IurhDRgfu//rlFSvo5Lu7Zq4CDHmkje4yG9dwtc4QmUcNZ5fGm39D9
	A/P6iddQcUOMZsjsBAT6AMjXcRUn9rTqLrPyHe/bwdrHfXOlqu8AIegGXsPq8yg3zRKyjoMOaKuyD
	Jy9SmZvLdQHOPOn5scXuaC4SDd3Vz3O1C7uAcqorGe2DPo58EV+0Hz260RaTOcbnb12y585h3qBBu
	zmjTI0IJX535vx5uS/qVCF2Euu+t6pQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqGMF-0008CK-Rc; Sun, 03 Feb 2019 11:54:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqGMB-0007aY-L1
 for linux-amlogic@lists.infradead.org; Sun, 03 Feb 2019 11:54:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id t27so11562818wra.6
 for <linux-amlogic@lists.infradead.org>; Sun, 03 Feb 2019 03:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OkeFe194w6p/4ugaiRVepZBG9GaYeNj8vqctJq+g0zo=;
 b=LvQgmXiboVnx1u4gfA7dfzFgf4DvSiIJEXgG2k+AoaNsRqKPXazSsIIABlHgIUsoYf
 jmoJIcFyXZLqaLcbeOKZWABugj/w0P9CgRNa28xlU3X3JklJKxDWN3UydZJg3JoNMrB0
 YGNwH1+vQNRNRgijyuWbkrRSBKixjW4B+VE8ixzV7Td6XKePm3YUfnjbhvmbfujImqiI
 JSGtJRsBMJ8xcUFgiYWYyytMs/UpozcgpubH7rw+RQYHkX658/KTDRLbF4nRJoaYzupT
 HLfn0yDRF+tOqq1WS+WQ98yVW/IKLk9YgH6Utvp7mvSgQ7p+GoCwCLDqHPl4t/VskV3G
 DydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OkeFe194w6p/4ugaiRVepZBG9GaYeNj8vqctJq+g0zo=;
 b=COO094qe1BHxkllmgDuF+BMwB5+vE2Cs7yDM6Kks5aKTUNOa0aM7W0HQcjYazLVo1S
 jjC5ClCr/XmV+aD5vCq2KCy+PG1/8Vif4OYW602nbc3I5nSBfkDRH5PlKqps5HgF0tat
 dn3sBt+Kb+P/d9ojQXlqE4wVhJ0moIAtTvKF+Wpvg1Qhu0ZkLXqzkT+FYppm01vFBLKA
 WUbqwJzsYItZYrm3ainTWA/uyrez/VfvMBW8OzJdgCcYtE1JfNdFQQ8gSqlx7q5Fpzd4
 SqQHhJUOM1CaXy6JztRNjUV9uqi2tnh8Pg/4z2QutFd9kxeenF5KmHj7wFpcq+mLfDxl
 OErA==
X-Gm-Message-State: AJcUukezyYaxrWXavkiI+2bqmrpxQGqAEy8kWNAHBNTemTORv1plXhWc
 ggohg2YFb0i1aAOx3XYsHTwOAm7v
X-Google-Smtp-Source: ALg8bN7uVKGT+PcO7qbYJLz9/5JvCjzWk92RY5QGufzdi4zo0GE8dwHHMQCeD8MNos5rcJqJW30WIQ==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr47805799wrn.109.1549194877335; 
 Sun, 03 Feb 2019 03:54:37 -0800 (PST)
Received: from afl1.intra.ditec.sk (adsl-dyn125.78-98-60.t-com.sk.
 [78.98.60.125])
 by smtp.googlemail.com with ESMTPSA id w10sm18475905wmb.1.2019.02.03.03.54.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Feb 2019 03:54:36 -0800 (PST)
From: afl1 <afl2001@gmail.com>
To: linux-amlogic@lists.infradead.org
Subject: Add tsin pins for meson-gxbb/gxl/gxm
Date: Sun,  3 Feb 2019 12:53:23 +0100
Message-Id: <20190203115324.9097-1-afl2001@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190203_035439_779236_9EFD8D16 
X-CRM114-Status: UNSURE (   4.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: afl1 <afl2001@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

---
This commit add tsin pins for meson-gxbb/gxl/gxm. 
The commit was verified with 150balbes LE 9.1 - linux 4.20.5 with intrernal dvb support.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
