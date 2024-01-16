Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA22C47077
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jan 2024 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eZ0IDfcvPyZZFAy6WE1xwWRh+aRMy6dCze8l1JVIfY0=; b=ouCLS40qsKdF3v
	gI8pkfLkTzCShK82g48LZ9sQoFn33B2eEvykllhPF0rQc3aCF1PNTyFi5991zrh1CazU1wodsIS0x
	XvO87nCjm6WI23ti/x6NQijcY0QIAYkNf85X714JiKf18JdnmrAV2rFggrPho7K9r/5QE3iV6Iyd/
	0hHJwYuhgqZVQj0/6EldZpqJpZnYslOixduTiyYk+OXnN7OPePjlVvVOPzAqyn8N3ue6Ml4nSPDed
	hqVCsk7/nBwQfeJ4xsn2m8L0npt6Z89kS5umUXussyA0Xm8i05lj3jLDHfw3U/IycFV9KnKNDiMxt
	u1CQdx7rYD3ooMVw5fpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPew2-00BRNr-0e;
	Tue, 16 Jan 2024 08:36:38 +0000
Received: from mail.entropitech.pl ([141.94.250.74])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPevy-00BRNW-1p
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Jan 2024 08:36:35 +0000
Received: by mail.entropitech.pl (Postfix, from userid 1002)
	id F054EA3E79; Tue, 16 Jan 2024 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=entropitech.pl;
	s=mail; t=1705394192;
	bh=3C0lFFl3FyqJxhWazybBxamNtYGn+JlC8TtPqc/zclI=;
	h=Date:From:To:Subject:From;
	b=HKqd+gLjKQtiiArN7pJ2s6s6JTUHqaHb163VfshgYmyFD+TXqBk0Dx94lqn2loZXi
	 B/jJ4+5GYOKlpdvmZj/0wtR+yZ2ncl/oRNibXX/Kwdsar3VWA83NFfrz5RQV5IQFke
	 nDDPm1tN203CXgHyEU88rWJFSgjOK16VUZ7tAaJMvy/rk88BXLaRlfHg8g7afNbuhm
	 3kotVjvHowA+1WYQc4t4uAvCJgaO381ztWDUkLTpu6zI+p69Y0Zk9xwR/soHQ8tv6n
	 qC7ijj+Di9b+HDt+9FN0Z9ky9HLfLmSqYzTQndoJlQuXCs/0gtW2iKSScfWM4FDuJQ
	 Ba9yAaNizs+2Q==
Received: by mail.entropitech.pl for <linux-amlogic@lists.infradead.org>; Tue, 16 Jan 2024 08:36:04 GMT
Message-ID: <20240116074500-0.1.ed.p6ks.0.7la08hs48i@entropitech.pl>
Date: Tue, 16 Jan 2024 08:36:04 GMT
From: "Szymon Faryk" <szymon.faryk@entropitech.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Zam=C3=B3wienie_na_klimatyzatory_postojowe?=
X-Mailer: mail.entropitech.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_003634_773608_95ADB5D8 
X-CRM114-Status: UNSURE (   1.26  )
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

RHppZcWEIGRvYnJ5LCAKCmtvbnRha3R1asSZIHNpxJkgeiBQYcWEc3R3ZW0sIHBvbmlld2HFvCB3
IG9mZXJjaWUgbmFzemVqIGZpcm15IHpuYWpkxIUgUGHFhHN0d28gc3plcm9raSB3eWLDs3Igbm93
b2N6ZXNuZWogaSBpbnR1aWN5am5laiBrbGltYXR5emFjamkgcG9zdG9qb3dlaiBkbyBhdXQgaSBt
YXN6eW4uCgpPZmVydWplbXkgc3dvaW0gS2xpZW50b20gdXJ6xIVkemVuaWEgY3pvxYJvd3ljaCBw
cm9kdWNlbnTDs3csIG1hasSFIFBhxYRzdHdvIG1vxbxsaXdvxZvEhyB3eWJyYcSHIGluc3RhbGFj
asSZLCBrdMOzcmEgc3BlxYJuaSB3c3p5c3RraWUgb2N6ZWtpd2FuaWEgaSB6YXBld25pIGtvbWZv
cnQgdyBrYcW8ZHljaCB3YXJ1bmthY2guCgpNYW15IHcgc3dvaW0gYXNvcnR5bWVuY2llIGtsaW1h
dHl6YXRvcnkgcG9kxYJhd2tvd2UsIGthbWVyb3dlLCBrbGltYXR5emF0b3J5IHogcGlsb3RlbSBv
cmF6IHJvendpxIV6YW5pYSBkb3Bhc293YW5lIGRvIGthbXBlcsOzdyBpIMWCb2R6aS4KClpham11
amVteSBzacSZIG5pZSB0eWxrbyBzcHJ6ZWRhxbzEhSwgYWxlIHLDs3duaWXFvCBmYWNob3d5bSBk
b3JhZHp0d2VtIGkgbW9udGHFvGVtIGtsaW1hdHl6YWNqaS4gxZp3aWFkY3p5bXkgcsOzd25pZcW8
IHVzxYJ1Z2kgc2Vyd2lzb3dlIGkgcHJ6ZWdsxIVkeS4gCgpDenkgc8SFIFBhxYRzdHdvIHphaW50
ZXJlc293YW5pPyAKCgpQb3pkcmF3aWFtClN6eW1vbiBGYXJ5awoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
