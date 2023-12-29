Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88399C46CD4
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Dec 2023 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=36gRQaY3Qfta6Bv2C9Pzv3z1xvH4C6jCaX/b1QXlriM=; b=dN7skyv9EPFdfm
	wdoNlUZd94xhI8u8pAVvr83YGbghBLCJxVoT8ptyLceUEAYEJX1ZjRZJkS8ufmlqsz5G99hZuQumo
	3EU2B9ln+ZbM0eaEYpUw9th+saXNjUceyJiMIcXL40GNSZPpr5zHmMyVLUKZ/PKrnie6/QJliweIV
	ukZmKD/VaK+YYwZiZQBFeiAIFSdCZTpAy/nZHAxHmJ5ybwBrDDD7W98DwYKAmYbiGUTN/1xQY/uwp
	+eYdqosIkHRVA+hb7IGBEtIqSTbczJYnBkRG4b0BWwO8VkA0VS799LTRZIUW8JqKaSlfwSdes/a1g
	SpGNqHI5uW00J5Yv6vkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ8hD-000Upe-0h;
	Fri, 29 Dec 2023 08:58:23 +0000
Received: from [162.19.155.126] (helo=mail.commercesolutions.pl)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ8h8-000Uof-0x
	for linux-amlogic@lists.infradead.org;
	Fri, 29 Dec 2023 08:58:21 +0000
Received: by mail.commercesolutions.pl (Postfix, from userid 1002)
	id 41B9423E4B; Fri, 29 Dec 2023 08:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commercesolutions.pl;
	s=mail; t=1703840219;
	bh=PcMncQpBfIZCnTOfZJY5G1G+gaLn4c9QPfFvoXrE4rA=;
	h=Date:From:To:Subject:From;
	b=hLZu+4EKlnSI2haR+qfEgUZJoVkA95mkpKwJRj4+oj150s/OJ/gwUdZY+A+gfKd8A
	 +xlLymUL9hE5KkuQsU46s99RrSBxAjs6l5ANtY7gPeXEgRzMbH5Zsq12kl5VAcmNAn
	 iiawRZjDUVI91HbKLt66SFjrNxXkLr1VbSIV/ocX99eWBZHe4Z+m5x9BYwDkG4XVy+
	 x3PyU2TzUtXfRMYhaE30b1Ax5LqMJeJbwxr1gSkmixNX3WDHy68gggCU7sSraZZwMZ
	 CJCTqO4yVj4tu0e0bjxl4/eet16EqeTGDsNXoBohFlPId3K2aywBQ4Bg+4/sUL/09D
	 eRy4Lp9QbXseA==
Received: by mail.commercesolutions.pl for <linux-amlogic@lists.infradead.org>; Fri, 29 Dec 2023 08:55:48 GMT
Message-ID: <20231229074500-0.1.ar.2ajsq.0.gle94nin5q@commercesolutions.pl>
Date: Fri, 29 Dec 2023 08:55:48 GMT
From: "Kamil Tralewski" <kamil.tralewski@commercesolutions.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.commercesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_005819_090486_DBFB1B00 
X-CRM114-Status: UNSURE (   0.78  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKUG96ZHJh
d2lhbQpLYW1pbCBUcmFsZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
