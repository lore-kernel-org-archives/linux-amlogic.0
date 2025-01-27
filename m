Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DA7CC0218C
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Jan 2025 08:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IYF9NOnoKLLfT7fJZI47Z85+z/fkGyR3jr7BfTTopaQ=; b=PJZbz5vuZmrDhx
	rQUBOZv3LOnr9gaL9MQlEuTztuGVSdM94P4KeOtAwG398nVXTL9jPuNAa5YnL7VL3bVxrOpiu+JX3
	iz0chyk6FbRsWL6U3mwnLrXNWDz3MNmwSYU1ORoxk/C1Mwu7UHsU/n83imEhmxVFL2J+FiNrAoZ0X
	xlHI6t5SlbdPxQxuhiG/Qj9YAUD4BO+24Zxg8R/iIV4jE/i2wbkMf0jS6CIiVvAt6WVxVPIYNE1i3
	ZgbAKjrMwTEA3f8G5CDlp1pq+Szuwx3c/kvkJJwkDmRlIbYZfXFpVXCLMvJm3Ggk8eBXG5F9WrMoz
	SFkk+/g6Zp3Eev9DwSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKxb-00000001wHI-3OIX;
	Mon, 27 Jan 2025 08:59:11 +0000
Received: from mail.growdeal.pl ([141.95.55.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcKxY-00000001wD0-0XS7
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Jan 2025 08:59:10 +0000
Received: by mail.growdeal.pl (Postfix, from userid 1002)
	id 95C89244DD; Mon, 27 Jan 2025 08:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growdeal.pl; s=mail;
	t=1737968156; bh=nU0fzD5wnLwbt9yoUSBeMInFHzMm7DGirLXtUO2ZpV8=;
	h=Date:From:To:Subject:From;
	b=dCLM+QIHIPJb/3NbxJYszYyH1PMsfAqQqzLy/6MjSjIdWbKgpaDvvhYywZH7BH2vo
	 W0p0w+ha5xndGo6r503CtOqwyExIFU8X7kbO0kiQavtUGqVjH3gaSg1J8aK/5HO0LX
	 2ZA72Rsx7EmmUJUpnv64Qbf21gleMHnfr5I93ZZbw+mkz9SBH65yfEKD+cK2dVepL+
	 8pCevAohf8jIX5zelyORmGyT4lkTF1/3mZ1qLw6io+8bM2FeeEjpUATj49Gj7HRUyr
	 jHc83xWvirtPZtJqpxr5v1wftbf5eFvrdBdsPgt3Y319r1TXO/GQCGYsNShid2zZ/H
	 Dn7TY2pUU48hA==
Received: by mail.growdeal.pl for <linux-amlogic@lists.infradead.org>; Mon, 27 Jan 2025 08:55:07 GMT
Message-ID: <20250127074500-0.1.8.pa1.0.1l0qmmbde2@growdeal.pl>
Date: Mon, 27 Jan 2025 08:55:07 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Zajdlicz"?= <pawel.zajdlicz@growdeal.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.growdeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_005908_866890_5D08EF71 
X-CRM114-Status: UNSURE (   1.06  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGF3ZcWCIFphamRsaWN6CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==
