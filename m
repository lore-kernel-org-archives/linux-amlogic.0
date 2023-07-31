Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93229C04A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0+G95c6pM6i/MajR2i+R7e8y2CyZ10O7yVG3u8oLZo=; b=AwHufkgvsdk2he
	IZUENO9JqV+FGpMbO59S9NWmyEqPd3Ml/WroLau+owHaysRcG9CLEz3Co61oZVBMxCQi2mA5v0trf
	iCzkRwVQlQ6afenCOSBNkZtfI195mXa4EN/0PZYsaQW/o0mOyG83Cxz1gykFk/Byg5JjZjHaAdkP8
	IBVfgK0ZbXfryZ+IQxPqTamKY/8jV+8hto2CC9/MeDg/g9rDARIFJvdaHKjmcZ4zdW38J7EYfnZuz
	1fz63w4yPd09Kwc/ODY0WINlNO0cds+PBm2/raI9+S34UTifJwQYVOg0o1lnf24/BB/g36VYMiziV
	BTPfs72VNbjmko0fCQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQORA-00EZNh-21;
	Mon, 31 Jul 2023 08:39:32 +0000
Received: from mail.cothiafon.pl ([217.61.106.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOR8-00EZKr-0h
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 08:39:31 +0000
Received: by mail.cothiafon.pl (Postfix, from userid 1002)
	id AC9DB837CC; Mon, 31 Jul 2023 10:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cothiafon.pl; s=mail;
	t=1690792641; bh=dwoca0X6C9VXklO/zRgFQCPapTk5LFz4tKaENdvy6Po=;
	h=Date:From:To:Subject:From;
	b=enbp7df93hoI+UQdwli2Xf8JrQQEjVipradMEgusCCZGzDZRRGYpOjHWfjiyYnF0D
	 2iDAR/3YSsi+Fbubub7TuF7wrvyr3HphhIwZhBK9+F/aOg/wDREMfju0b3QYzn3GI+
	 jkJY1mM7xYh/G4eSGU36QvVl+ZWT2bOC3SOMnN0cv/fO4AEfnHFtPZtJJrMAaynjPh
	 yTRWW9E5HcNFORA8SjgWwU/+LLlbHUJSTDGfHI5B+qYMiazFCRwCdreKgv0o5s6gu8
	 UZumpMIO4qLkDC1kw0tZ8tn6YHfXk91THYF43LmU2k/gHNMUJM77BhKL3+2AjzX5JG
	 LHmOudpTbCczg==
Received: by mail.cothiafon.pl for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 08:35:48 GMT
Message-ID: <20230731095940-0.1.28.onbm.0.66l254ygn1@cothiafon.pl>
Date: Mon, 31 Jul 2023 08:35:48 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@cothiafon.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.cothiafon.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_013930_403548_C0498AD8 
X-CRM114-Status: UNSURE (   0.31  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/CgoKUG96ZHJhd2lhbQpSYWRvc8WCYXcgR3JhYm93c2tpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
