Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYnJScgExj05QIUCgU/O8vTMsnjelMZMKprloXIbdzg=; b=DxD7IdEgxEK0rS9u92hwEJHY1k
	gkTnnRWIYsSFoq+NdbYB0KaxVi2M4vNW9wEMQmzqcz4uXpfm+okfNPzNk/e28TVc2D9t+T4kM3H8C
	f2actncABeorVf+PPDjXjWH+Ry5bwf+aY5Ncs02ppDbT5hdSLT237A2DEzT2U7hoK6IwCix5gmx+q
	kgiP/HdER5bzi+VI9QlCRStCRn/uzNWpzkk3EGWky+WWzFQcm/8x1N/BWuE0JOSXdMTyqsgFGAB9p
	0oR+7tnXsnoRn6CnbgSKADkvUEzoxQJemDlqx4NTqaMLXu4V34zZGmHeAUf56Yun4kkBAXoURwMto
	RVdsmqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6tqP-00BNCP-15; Mon, 10 Jan 2022 12:32:13 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6tqM-00BNAv-WD; Mon, 10 Jan 2022 12:32:12 +0000
Received: from [10.28.39.18] (10.28.39.18) by mail-sz.amlogic.com (10.28.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 10 Jan
 2022 20:32:09 +0800
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: New binding for
 Meson-S4 SoCs
To: Christian Hewitt <christianshewitt@gmail.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <20220108084218.31877-1-qianggui.song@amlogic.com>
 <20220108084218.31877-2-qianggui.song@amlogic.com>
 <A4441A27-7B49-4A9A-83FD-05144A63E705@gmail.com>
From: qianggui.song <Qianggui.Song@amlogic.com>
Message-ID: <50bc5a03-5c1f-10dc-b3c3-bdf78e435577@amlogic.com>
Date: Mon, 10 Jan 2022 20:33:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <A4441A27-7B49-4A9A-83FD-05144A63E705@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.28.39.18]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_043211_069298_54A9436F 
X-CRM114-Status: GOOD (  13.62  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzkvMjIgMTE6MjcgUE0sIENocmlzdGlhbiBIZXdpdHQgd3JvdGU6Cj4gCj4gCj4+IE9u
IDggSmFuIDIwMjIsIGF0IDEyOjQyIHBtLCBRaWFuZ2d1aSBTb25nIDxxaWFuZ2d1aS5zb25nQGFt
bG9naWMuY29tPiB3cm90ZToKPj4KPj4gVXBkYXRlIGR0LWJpbmRpbmcgZG9jdW1lbnQgZm9yIEdQ
SU8gaW50ZXJydXB0IGNvbnRyb2xsZXIgb2YgTWVzb24tUzQgU29Dcwo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBRaWFuZ2d1aSBTb25nIDxxaWFuZ2d1aS5zb25nQGFtbG9naWMuY29tPgo+PiAtLS0KPj4g
Li4uL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FtbG9naWMsbWVzb24tZ3Bpby1pbnRj
LnR4dCAgICB8IDEgKwo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50Yy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYW1sb2dpYyxtZXNvbi1ncGlvLWlu
dGMudHh0Cj4+IGluZGV4IDIzYjE4YjkyYzU1OC4uOTMwMDczNmJmMWVkIDEwMDY0NAo+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIv
YW1sb2dpYyxtZXNvbi1ncGlvLWludGMudHh0Cj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50
Yy50eHQKPj4gQEAgLTE4LDYgKzE4LDcgQEAgUmVxdWlyZWQgcHJvcGVydGllczoKPj4gICAgICAi
YW1sb2dpYyxtZXNvbi1nMTJhLWdwaW8taW50YyIgZm9yIEcxMkEgU29DcyAoUzkwNUQyLCBTOTA1
WDIsIFM5MDVZMikKPj4gICAgICAiYW1sb2dpYyxtZXNvbi1zbTEtZ3Bpby1pbnRjIiBmb3IgU00x
IFNvQ3MgKFM5MDVEMywgUzkwNVgzLCBTOTA1WTMpCj4+ICAgICAgImFtbG9naWMsbWVzb24tYTEt
Z3Bpby1pbnRjIiBmb3IgQTEgU29DcyAoQTExM0wpCj4+ICsgICAgImFtbG9naWMsbWVzb24tYTEt
Z3Bpby1pbnRjIiBmb3IgUzQgU29DcyAoUzgwMlgyLCBTOTA1WTQsIFM4MDVYMkcsIFM5MDVXMikK
PiAKPiBeIHNob3VsZCBiZSAiYW1sb2dpYyxtZXNvbi1zNC1ncGlvLWludGPigJ0gPwpZZXMsIHRo
YW5rcyBmb3IgcG9pbnRpbmcgb3V0Cj4gCj4gQ2hyaXN0aWFuCj4gCj4+IC0gcmVnIDogU3BlY2lm
aWVzIGJhc2UgcGh5c2ljYWwgYWRkcmVzcyBhbmQgc2l6ZSBvZiB0aGUgcmVnaXN0ZXJzLgo+PiAt
IGludGVycnVwdC1jb250cm9sbGVyIDogSWRlbnRpZmllcyB0aGUgbm9kZSBhcyBhbiBpbnRlcnJ1
cHQgY29udHJvbGxlci4KPj4gLSAjaW50ZXJydXB0LWNlbGxzIDogU3BlY2lmaWVzIHRoZSBudW1i
ZXIgb2YgY2VsbHMgbmVlZGVkIHRvIGVuY29kZSBhbgo+PiAtLSAKPj4gMi4zNC4xCj4+Cj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4
LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFybS1rZXJuZWwKPj4KPiAKPiAuCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
