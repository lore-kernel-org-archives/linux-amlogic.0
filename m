Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F296CA6C9D
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=28bShoLk8gu1c2JI5Xhy9ZleVBEPW1p59G+7qkjUP44=; b=Ghs2+Yb8emG15j
	Hqxw9HBJ9UB1VvS+zsrAqJfwTD1+GcdifqFofywuT+W807VvAKVj4xeD5dyTrcFx6B+i18hWo7KDD
	CtpZoZPz7mRkE6QrwDbX2EYdNUeIK+54imqXhvhxjsHPkGhCdv4nGZm5ElzHekh0RXQVR8bojCaR+
	zBd0C19d842BLhAHF8fA98Bg9gqDM8PHhrsnhHPkzzxgmA4NsTaRhl1jBPzXmp2VcWQ1rxc/SzF44
	scWXH9wWhXZIgkAoXGFkOPvIG5m5oFHWjHACaDgENhhd8wSespz9RRRdbmjj5HGABp4qpMmYwCNDf
	ZbPYnUI1bp1jxaLD1YoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeUM-0000000Dq8K-41FF;
	Tue, 27 Jan 2026 08:31:54 +0000
Received: from mail.venturex.pl ([141.95.86.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeUJ-0000000Dq7o-0553
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 08:31:53 +0000
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id 6406722E6C; Tue, 27 Jan 2026 09:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1769502706; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=joFRY68Uog4mCSoI4r0J56bIawoEyNf3zvSJSXtusTeMfB5Ivjod5gI2xH1tG52/W
	 I0eo4nxlLZ57P+eQzdpX13vDniR7KjfpSqfK+79Ee6egMdFsEyhO2J2wI8QuDUiBX6
	 ekmGJvBx5LDzS6D1Ink+p8zlzJa8AK2XPHMISKpPKeY6YnfqwJ+1ejRgVH9SplyBHZ
	 CY6QZGp3fhu9ZOHXzRv7b/Vv1JnclhJBiPN6e0Vo4vLvsL9hsYntU/w7DV4va/b8G9
	 K/Pe414PgN5iWZ4V4FVxQUDXwEeBOTGM9XZm22I4CmRIoYzyB5V+1mM9uE07vf8luj
	 5PK98TdGGqqVA==
Received: by mail.venturex.pl for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 08:30:14 GMT
Message-ID: <20260127084501-0.1.cb.2fdv2.0.vcz2vghiip@venturex.pl>
Date: Tue, 27 Jan 2026 08:30:14 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_003152_532886_8E2A6EA4 
X-CRM114-Status: UNSURE (   1.55  )
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

U3phbm93bmkgUGHFhHN0d28sCgpjenkgYnlsaWJ5IFBhxYRzdHdvIHphaW50ZXJlc293YW5pIHJv
em1vd8SFIG8gbW/FvGxpd3ljaCByb3p3acSFemFuaWFjaCBkbGEgc3dvamVqIGZpcm15IGkgcm9k
emlueT8KCk5vd2VsaXphY2phIHVzdGF3eSBvIEZ1bmRhY2phY2ggUm9kemlubnljaCBvdHdpZXJh
IHByemVkIHByemVkc2nEmWJpb3JjYW1pIHp1cGXFgm5pZSBub3dlIG1vxbxsaXdvxZtjaSBvY2hy
b255IG1hasSFdGt1IGkgcGxhbm93YW5pYSBzdWtjZXNqaS4gRnVuZGFjamEgUm9kemlubmEgcG96
d2FsYSBvZGR6aWVsacSHIGFrdHl3YSBvZCByeXp5ayBiaXpuZXNvd3ljaCwgcHJhd255Y2ggaSBw
b2RhdGtvd3ljaCwgYSBqZWRub2N6ZcWbbmllIHphY2hvd2HEhyBrb250cm9sxJkgbmFkIHN3b2lt
IG1hasSFdGtpZW0gaSB6YWRiYcSHIG8gamVnbyB0cndhxYJvxZvEhyBkbGEga29sZWpueWNoIHBv
a29sZcWELgoKQ28gaXN0b3RuZSwgcG8gdXDFgnl3aWUgMTAgbGF0IG9kIHduaWVzaWVuaWEgYWt0
eXfDs3cgZG8gZnVuZGFjamksIHJvc3pjemVuaWEgbyB6YWNob3dlayBwcnplc3RhasSFIG9ib3dp
xIV6eXdhxIcuIFVzdGF3b2Rhd2NhIHByemV3aWR6aWHFgiByw7N3bmllxbwgbGljem5lIHp3b2xu
aWVuaWEgcG9kYXRrb3dlIG9iZWptdWrEhWNlIG0uaW4uIGRvY2hvZHkgeiBkemlhxYJhbG5vxZtj
aSBnb3Nwb2RhcmN6ZWogY3p5IHd5bmFqZW0gbmllcnVjaG9tb8WbY2kuCgpCxJlkxJkgd2R6acSZ
Y3pueSB6YSBpbmZvcm1hY2rEmSwgY3p5IGNoY2llbGlieSBQYcWEc3R3byBwb3puYcSHIG1vxbxs
aXdvxZvEhyBzdHdvcnplbmlhIEZ1bmRhY2ppIFJvZHppbm5laj8KCgpQb3pkcmF3aWFtCk1pa2/F
gmFqIFJhawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=
