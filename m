Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682F1E6C61A
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Dec 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=crkB/OHGNlAZ5oVlAiNB8eMs8sEGH3bSKi8UpVUwF20=; b=L9/DIUzZJszNzo
	meOyXDCuhzkgW8iKdip3Pf9jShLI8vsHiMFjYRsGRRU4AIS80am+93Vnv25DjLcw6EPCQvsAsmYti
	2l8n6h0oRlAG1CQwIOb0oH8sVpe2E11077Vz1TaE3hLoIapaCeiT0BPheL9RiAiLMBE+lKiT9X5fh
	o8X15ZBl/v4nQ4p0EoJoXeSTNv+5f6iN5+m65Ou2lZFe7KhayxTV3plCHf1mNJ5ar7vcVRZGVRTvV
	AfgdmumIJOLMijJMzkq8SMsOqma39ZKjDCUeapRXmi4ZQwi/oDf6HELjYjShv9vDqsonhyCZmD1hn
	kmH6LzKJz+98kPJMy43g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP1r-00000008qG4-2fZY;
	Tue, 03 Dec 2024 09:17:11 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIP1h-00000008qB9-28Oz
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Dec 2024 09:17:03 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id 67DF24CD0B; Tue,  3 Dec 2024 10:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1733217385; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=jsy4DzREYaAnpmYYh4WLWH+7y9xZXmRttEtuYmbO3YmsT13g3zMPGjBUzBJCQEAga
	 pocu6uktNa4ZRWCzDbzkyN9dinOkFq/BmCqsj/Qmvk6Nkzv7mdVrarUAq5z2TVSVGr
	 xEDbV7/NJBe1XQztj669zTJO2c+9iZnUfVzuSxPd+CeZWfRXu0AL2/myfSdsljLL13
	 trpXxD7kW3Mf3H4eB3iskyl4frRpy5P09NDyrVoRYXjSEDBDrBdgro5CF5EVeJuCy/
	 qh+qlsmC8V8iXpgkJFg+wH6YPYE9HoZp8/S796JWYj3jzhbzjHf2CourcbICtBQR9m
	 GEiefLKfkscjQ==
Received: by mail.fintara.pl for <linux-amlogic@lists.infradead.org>; Tue,  3 Dec 2024 09:15:29 GMT
Message-ID: <20241203084500-0.1.6g.13vn8.0.174h14i4mj@fintara.pl>
Date: Tue,  3 Dec 2024 09:15:29 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011702_221616_2E9FC4C0 
X-CRM114-Status: UNSURE (   1.35  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
