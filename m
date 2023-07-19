Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65370C001DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:
	Subject:Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=KNbZNB/ljXYXxNaHLvwQ+1yfag9uTyWEfZms18/mgI8=; b=eag
	b5qui7UrJ4CNkeEqtLCqWa811hJBUscSth/H46FNqs+0j4qnnJiE/oBiPeUnvLpxQh7YNPk9DuRYb
	NioWQGQME9jBnNC5JOoUvCjddRTEPQnPF3MX8ZTtRg9Pb3x0U1LP3a4HYeDmTeY1d4ICXsNpRft0P
	DlWlamGwyuK+jSpwieX8zM2QDhOCqPOjHTqtIL/z7Gq3ooxz/3T76o7qvgRYPpjL6OandMR89Z0MT
	puEutxeR8ccA0gWA3hZMD5tNzfuBoqzvht/YaNnu3+YuRYlIz1Bd4ZQacpmw9aPaO2s8KdJYoGBU1
	ieZ9uEwnmJ6wBJ1XjDcosDZjfA1wotw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM10c-005v9d-0M;
	Wed, 19 Jul 2023 06:50:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM10a-005v8i-2z
	for linux-amlogic@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Reply-To:Date:From:To:
	Subject:Content-Description:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Sender:Cc:Content-ID:In-Reply-To:References;
	bh=Aor/WLwl4h5zbhGzya8ajVmHiT+79UPpoXAPFDddDh4=; b=lo5CJydd261/Wrc19aWifqsRDr
	+aU7TRNws/xa6smygqQSz5z3TALtMMPOJ0y0KNy6SGlgmjAwe66XZ4B8bPrSujOzz0Y5j7VwW+Y+o
	I7u1yB0w0tWdozyjrcvOAnPKHhYVDE7veTaws5sSm60ogrTIIVLsXbmlXEC0tjZdRoTGBVK5Th/ri
	G5xFgsEQGcPlcWmqPXY8liStWjBNXxXjBiPY6Anlozu0J1PGUngI3dBg1Tt+eDaXn5REEQ57pT1C/
	AXA6whuPSYcs5ssQfW9ByRhVTe87Denn2V1wEBiVYBFfIF54jpoyxDgiiuim2ZlTIVJUY1Gx1rnOv
	15pV5+8Q==;
Received: from mail.maracanau.ce.gov.br ([187.86.206.254])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLuiB-00CGNy-07
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Jul 2023 00:06:50 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTP id 2A00EB09867
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Jul 2023 21:04:19 -0300 (-03)
Received: from mail.maracanau.ce.gov.br ([127.0.0.1])
	by localhost (mail.maracanau.ce.gov.br [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id HEWBH13PpNIH for <linux-amlogic@lists.infradead.org>;
	Tue, 18 Jul 2023 21:04:19 -0300 (-03)
Received: from localhost (localhost [127.0.0.1])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTP id 008CAB09868
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Jul 2023 21:04:18 -0300 (-03)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.maracanau.ce.gov.br 008CAB09868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maracanau.ce.gov.br;
	s=5B33696C-FA0D-11EC-880A-860953C84890; t=1689725059;
	bh=Aor/WLwl4h5zbhGzya8ajVmHiT+79UPpoXAPFDddDh4=;
	h=MIME-Version:To:From:Date:Message-Id;
	b=IjKElnD4o2aBF6CAwOT9De4zw6SvpyyQm3oTmoabnVHCWsR93qTd27/fl3l6dmutM
	 qetVI31oy5b0Xi1cAVhWGoE4MS49paaH2rnaxgDvGIQubrmrL1pTBK+Vm0MSg7K2T+
	 nN22rPLtA+7UqrdD02SgpfYdn+zjZp2f/a2P+59ZtxegvyaWnLqhpwebGMSxNQFnGv
	 ZOoYcOxFBcSoOHUUBBm6J3V+5o9AJJhW63BmX0QZiKwKc0KQX6jPQ5pDiHb4SjTHmD
	 doT0Pny6/r3ET2JI1br7DdV/s6/PxJLyCRLITgRu8ZfizdWgShUB0Y2PdSW+tUJiD3
	 TQ8qkuoan0ynw==
X-Virus-Scanned: amavisd-new at maracanau.ce.gov.br
Received: from mail.maracanau.ce.gov.br ([127.0.0.1])
	by localhost (mail.maracanau.ce.gov.br [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 3h1N6UaMvIHe for <linux-amlogic@lists.infradead.org>;
	Tue, 18 Jul 2023 21:04:18 -0300 (-03)
Received: from [192.168.0.166] (unknown [105.8.1.58])
	by mail.maracanau.ce.gov.br (Postfix) with ESMTPSA id 363CBB0985C
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Jul 2023 21:04:17 -0300 (-03)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: =?utf-8?b?RHVsZcW+aXTDoSB6cHLDoXZhOyDigqwgMiwwMDAsMDAwJzAwIEVVUg==?=
To: linux-amlogic@lists.infradead.org
From: "Pan Richard Wahl" <coordenadoriasdp_camara@maracanau.ce.gov.br>
Date: Tue, 18 Jul 2023 17:04:10 -0700
Message-Id: <20230719000418.363CBB0985C@mail.maracanau.ce.gov.br>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_010638_876346_7B9DCBA8 
X-CRM114-Status: UNSURE (  -2.45  )
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
Reply-To: info@wahlfoundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

RHJhaMO9IHByw610ZWxpLAoKSnNlbSBwYW4gUmljaGFyZCBXYWhsLCBtZWdhIHbDrXRleiA1MzMg
bWlsaW9udSAkIHYgamFja3BvdHUgTWVnYSBNaWxsaW9ucy4gRGFydWppIDUgbsOhaG9kbmUgdnli
cmFuw71tIGxpZGVtLiBQb2t1ZCBvYmRyxb7DrXRlIHRlbnRvIGUtbWFpbCwgYnlsIHbDocWhIGUt
bWFpbCB2eWJyw6FuIHBvIHJvenRvY2Vuw60ga291bGUuIFZldMWhaW51IHN2w6lobyBtYWpldGt1
IGpzZW0gcm96ZGFsIHJhZGUgY2hhcml0YXRpdm7DrWNoIG9yZ2FuaXphY8OtIGEgb3JnYW5pemFj
w60uIERvYnJvdm9sbmUganNlbSBzZSByb3pob2RsIHZlbm92YXQgdsOhbSBjw6FzdGt1IOKCrCAy
LDAwMCwwMDAnMDAgRVVSIGpha28gamVkbm9tdSB6IDUgdnlicmFuw71jaCwgYWJ5Y2ggc2kgb3Zl
cmlsIHN2w6kgdsO9aHJ5IHByb3N0cmVkbmljdHbDrW0gbsOtxb5lIHV2ZWRlbsOpIHN0csOhbmt5
IFlvdVR1YmUuCgpWSUTDjVRFIE1FIFpERSBodHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92
PXRuZTAyRXhORHJ3CgpUT1RPIEpFIFbDgcWgIERBUk9WQUPDjSBLw5NEOiBbREZEVzQzMDM0Ulcy
MDIzXQoKT2Rwb3ZlenRlIG5hIHRlbnRvIGUtbWFpbCBhIHV2ZWR0ZSBrw7NkIGRhcnU6IGluZm9A
d2FobGZvdW5kYXRpb24ub3JnCgpEb3Vmw6FtLCDFvmUgdsOhbSBhIHZhxaHDrSByb2RpbmUgdWRl
bMOhbSByYWRvc3QuCgpQb3pkcmF2eSwKUGFuIFJpY2hhcmQgV2FobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
