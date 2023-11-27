Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF11DC4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z8zUnvg+07jzaN6906thrA2rRfTS9W5Yokn18HqFXio=; b=ZBx3o12deadmBM
	3VaQtBbsDwK47xwMeXxVQJYe+wDGT2a6SUARHqDaRM2ERsYmOBIVztwPMGDT/478k5gNoqr+6GF2Q
	+t6I0RjDgszWzVi8S1ZUl+EasBjh1kVfjXqd3I9/3vT9Hw+yXGjWqN9fsktCzI9EgodofUQCaWuCS
	ynscwpkoJ24kMBeQhAyTuuE6apmy1rKt8cLA3coNi9bzBRSw2hvtoPeXX9t9LjkEugsPcl4C0LOfU
	zrMG4mZUHLF9ldUfBodr+b8fGdkCTnLx1qfsdzAtdE28GhCeA7lNCBo+mPk3pRZifXsvDeAo8q46z
	iIa7PbCXTz8otSqOprvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZk-001vBz-03;
	Mon, 27 Nov 2023 09:06:44 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7XZh-001vB2-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 09:06:42 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id F23B9250EB; Mon, 27 Nov 2023 09:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1701075946; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=zoo2wciZ3+jxaf8/ED/wl1+hs23t/Ihsvqs2Od9PGtx65p8f43wkSiD/KF3X4FjoN
	 HfD+m6F8jygK9zfYUDifenc548vUnerhWxR+WzvMIL5JzujyfJCQZ1aB52LsE6/3Av
	 S+cIQovajZHAHyuuAXQKCOHFYjnnkPzehAwww/HTMZorM3Q91Umc23nNR1g7TxxJtw
	 +wtmPh/jBfuK4BxwbxBkAZnsr5vi0bBK69oFpFRVOCDyugOpHtTR0jV2Em/CWBJGLu
	 kWh5iV3mphEBaoe+b4RGwBnsDdRHK1jGiYXLgyY5R1LWUG2mDEwZgkWC58k1T4gqyG
	 BSbdEO4HhSdJA==
Received: by mail.thrivehub.pl for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 09:05:02 GMT
Message-ID: <20231127074500-0.1.35.1bpcz.0.m01i2o8jm6@thrivehub.pl>
Date: Mon, 27 Nov 2023 09:05:02 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_010641_578947_01D93D54 
X-CRM114-Status: UNSURE (   1.18  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpTenlt
b24gSmFua293c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
