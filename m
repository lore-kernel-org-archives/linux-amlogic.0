Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF08E77188
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2024 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PBVOHJugAU6LyfwU/+qLErtFOUsViUko/8I6VrI10MQ=; b=AvDEgQog3Kc8uo
	idYmQCA9Ks4Vky2E+v31YPbkDvGSZSwVKxNuQ96SmzYhV5ygpCa9DK2zyjuN+7DiXvzt+q4aeaK27
	yUm3rZOuDWFkwZCH+N42quS8m0UjPwlcTUwyCFdItTBTAN6e9NG2GJ6PJIR+IAogalK1udcOY4ygR
	KGo1kP6zFGZap4jGs7YkqNR+OSFbqDRxGUsV5tgBf3RwpjJakiWrCdRBpmR+5r668ZAgN7kovwboG
	xPnE4NOlCGWi2UFUIOFeSNeRWHBA5zNe3CoVW81LgbrQjxT5B25DljYjW/HfpLPW7TrvILYUmCfNd
	CmEOLGwx0j5glA3HL75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSY2s-00000006rNv-3PG8;
	Tue, 31 Dec 2024 08:56:10 +0000
Received: from mail.finoplus.pl ([94.177.238.25])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSY2p-00000006rNB-08O0
	for linux-amlogic@lists.infradead.org;
	Tue, 31 Dec 2024 08:56:09 +0000
Received: by mail.finoplus.pl (Postfix, from userid 1002)
	id C8E7782D7D; Tue, 31 Dec 2024 09:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finoplus.pl; s=mail;
	t=1735635360; bh=cD6ZiYZPfnTHveQoLEkQv8j5EP2cE9hI2+tv5HbcV0g=;
	h=Date:From:To:Subject:From;
	b=DN8090LfaTsQ/lxiw/jiPF/CZgHFZ+LacJJsTwae+nIc986qTEHbwvBN7+0junbk3
	 hN+yvu8ItKQM2Gy7WxCdsOvfUoV01CZdSw8ICk7CtfQP3p+p99HP0TRzgxo/y4w+03
	 c++mimcKUtmgVaFmlc4wf0BXGtXlnkYiWAbwHPV7HORjT+yDq4xSMijjPTFxzg42fm
	 Y5Mls5V2JZmqshgV1tdgwMh79EoHlWCXMapzxmkbTOm3xvbViB22bQo+7FtOD5vcMR
	 mvMeSh/qTD/fs2fJUU+8IOysO8SFQwLqTrCjhX5cv13IaefaCd2xyVoOeRr/ya+wxn
	 aVQ5H9dFEbLCA==
Received: by mail.finoplus.pl for <linux-amlogic@lists.infradead.org>; Tue, 31 Dec 2024 08:55:55 GMT
Message-ID: <20241231084501-0.1.7g.c7cb.0.hu6oeg6379@finoplus.pl>
Date: Tue, 31 Dec 2024 08:55:55 GMT
From: "Joanna Pachnau" <joanna.pachnau@finoplus.pl>
To: <linux-amlogic@lists.infradead.org>
Subject: =?UTF-8?Q?Przyznanie_=C5=9Brodk=C3=B3w?=
X-Mailer: mail.finoplus.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_005607_800655_7EE116AB 
X-CRM114-Status: UNSURE (   1.04  )
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

RHppZcWEIGRvYnJ5LAoKcGlzesSZIGRvIFBhxYRzdHdhLCBwb25pZXdhxbwgZG9zdHJ6ZWdhbSBt
b8W8bGl3b8WbxIcgcG96eXNrYW5pYSBkbGEgUGHFhHN0d2EgZG9kYXRrb3d5Y2ggxZtyb2Rrw7N3
IG5hIGR6aWHFgmFsbm/Fm8SHIHogYmFua3UuCgpQb21hZ2FtIHBvenlza2HEhyB3c3BhcmNpZSBm
aW5hbnNvd2UgZGxhIHByemVkc2nEmWJpb3Jjw7N3LCBrdMOzcnp5IHByb3dhZHrEhSBqZWRub29z
b2Jvd8SFIGR6aWHFgmFsbm/Fm8SHIGdvc3BvZGFyY3rEhSBvcmF6IGZpcm0gdyBmb3JtaWUgc3DD
s8WCa2kuIEpha28gc3BlY2phbGlzdGEgbmllendpxIV6YW55IHogxbxhZG55bSBiYW5raWVtIGd3
YXJhbnR1asSZIG5hamxlcHN6ZSB6IG1vxbxsaXd5Y2ggd2FydW5rw7N3LgoKV3NwaWVyYW0gbmEg
a2HFvGR5bSBldGFwaWUgd25pb3Nrb3dhbmlhIG9yYXogdyB3eXBlxYJuaWVuaXUgd3N6eXN0a2lj
aCBmb3JtYWxub8WbY2kuCgpDaGNlY2llIFBhxYRzdHdvIG5pZXpvYm93acSFenVqxIVjbyBzcHJh
d2R6acSHIGRvc3TEmXBuZSBvcGNqZSB6IHLDs8W8bnljaCBwbGFjw7N3ZWs/CgoKUG96ZHJhd2lh
bQpKb2FubmEgUGFjaG5hdQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
