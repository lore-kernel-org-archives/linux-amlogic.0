Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5841DC001DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Aug 2023 06:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F6hD+C4Z9fnoDjrNXtIJa2Yzr4QJp0vD7X39E3QUd9Q=; b=gXQzZVQhY0II0r
	VYKaN8N/fFGTDGRCjx0aQDBKowHUypPhduTaHZtRZ6MonFTyaWb/foYhXOmX6ZtdigYPXLMhXrIWP
	LffvcL/yteDFDSJQ+5wg+mp1cwZnVSn11Z/DR5JNlaZpCOIAETc0hXrCB3S1pVMOmqG9U3O+hHVMo
	GpsV8CLY6h+F/263Oiw1buVxjtNL+j4fsXvYomDsGQU+fJRl8om+Dc4Gp7YHhlBxTWAgyNFapTN6e
	yT0jn/Jlcg9DMV+5ikw1otOyR1Tfqq/KJefxpq8yWWSbFMCJ6TakIwhV87NG5d3jFYbs/3xduxX+x
	x8bHhvBcz+qUPKcNOYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFuu-001nPm-0U;
	Tue, 08 Aug 2023 06:10:04 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTFuq-001nNh-1l
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Aug 2023 06:10:03 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9f48b6796so80482081fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Aug 2023 23:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1691474997; x=1692079797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYPXrTj0ac3/TbvRu9WrEZ10bFywEsKaB4qoBFTir7E=;
        b=NGOa4ZcpppUueL4E3M/XS19HqcABepUZTvRIC8EdtBcxyFyZVhGVej07iERw8EIDrO
         NCjZ+shIa2rhaNgR2WeN6Twno6wReauHVYxt6Zdw7eTwEBmbpQfyAQbLk+8NhT+Z8tjz
         kwpKneYfdjQrds7rVBsIbP/xDrgBVx9Cx16AWrxxssIWDiy/BLu5+JTFWFvOTJCJGoQr
         qAstsLJTOjxn1gU2Q2rovkXv28MrK3EAhnoLE2YsTucsucBR0RHtbK24e+hTUReqQn14
         Pr4+4QGux4ETlogSZQ0bukA1NYG7FLD3n6mWVRnCYV32l7dUPGoF9zEaW1biwzSGRw8x
         5T6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691474997; x=1692079797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYPXrTj0ac3/TbvRu9WrEZ10bFywEsKaB4qoBFTir7E=;
        b=f2+TuHk+JniSQGrVIkHpGuQItNqGdPdL4xbf5+tHqIc5uRM2FFnuTjpwnnmlFRBEQP
         0LMtUTnyVTBOMqX5krZNi9Z1xKBZkVKK0M3l4qTLR9OO0cztPKBiVFAOrtiH2qZyfFCy
         kqIR5x0b4zYZ6Oicn3pyWvDMEuxNPHLCc82phn8S0OgmgKUOrwQS091ABPgwlD7KHqER
         Ay0BZyuk6yLztDtTW7iC4WZWvY4PHoefL+zSIxX2sdopiJcTEjKv3dz9QTw7tg0Dw8u1
         fLSMMOk/IebYvXemU8bATDJn0c8t+AbZ9ElTWE+4nTCamrh1jZhic4crMd5zRQnod4q0
         qKbg==
X-Gm-Message-State: AOJu0Yw/l+GH6XQT0kaCXBbDbtQ2kiMJn4ABjht+ds1f+0PobavmWIcM
	ZsZAAmtp+wFS2W4w24si9N7b3Au7/lA2DaAIIcPUMIiToacteXYbP89MLHf46is=
X-Google-Smtp-Source: AGHT+IGwJkEwmhGtX5OwedSjwf3ch9f4Rn33ZkTyBMpaVuhixVe3FEg1sM8V6DxiweX0z+J81sYoBkLLrAGCleGW+tw=
X-Received: by 2002:a2e:87c6:0:b0:2b6:e2aa:8fc2 with SMTP id
 v6-20020a2e87c6000000b002b6e2aa8fc2mr6824193ljj.46.1691474997354; Mon, 07 Aug
 2023 23:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230808032510.31754-1-luke.lu@libre.computer> <2023080851-duh-scroll-09bf@gregkh>
In-Reply-To: <2023080851-duh-scroll-09bf@gregkh>
From: Luke Lu <luke.lu@libre.computer>
Date: Tue, 8 Aug 2023 06:09:45 +0000
Message-ID: <CAAzmgs5U=BNzNNeskUMe_YEken1-CmzssRFPDCmsmar9SQo+WQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: do post init to fix broken usb
 after resumption
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Da Xue <da@libre.computer>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_231001_006088_ACEBC8C2 
X-CRM114-Status: GOOD (  16.99  )
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

SEkgR3JlZzoKCk9uIFR1ZSwgQXVnIDgsIDIwMjMgYXQgNDo1NuKAr0FNIEdyZWcgS3JvYWgtSGFy
dG1hbgo8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcg
MDgsIDIwMjMgYXQgMDM6MjU6MTBBTSArMDAwMCwgTHVrZSBMdSB3cm90ZToKPiA+IERldmljZSBj
b25uZWN0ZWQgdG8gdXNiIG90ZyBwb3J0IG9mIEdYTC1iYXNlZCBib2FyZHMgY2FuIG5vdCBiZQo+
ID4gcmVjb2duaXNlZCBhZnRlciByZXN1bXB0aW9uLCBkb2Vzbid0IHJlY292ZXIgZXZlbiBpZiBk
aXNjb25uZWN0IGFuZAo+ID4gcmVjb25uZWN0IHRoZSBkZXZpY2UuIGRtZXNnIHNob3dzIGl0IGRp
c2Nvbm5lY3RzIGR1cmluZyByZXN1bXB0aW9uLgo+ID4KPiA+IFsgICA0MS40OTI5MTFdIHVzYiAx
LTI6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDMKPiA+IFsgICA0MS40OTkzNDZdIHVz
YiAxLTI6IHVucmVnaXN0ZXJpbmcgZGV2aWNlCj4gPiBbICAgNDEuNTExOTM5XSB1c2IgMS0yOiB1
bnJlZ2lzdGVyaW5nIGludGVyZmFjZSAxLTI6MS4wCj4gPgo+ID4gQ2FsbGluZyB1c2JfcG9zdF9p
bml0KCkgd2lsbCBmaXggdGhpcyBpc3N1ZSwgYW5kIGl0J3MgdGVzdGVkIGFuZAo+ID4gdmVyaWZp
ZWQgb24gbGlicmV0ZWNoJ3MgYW1sLXM5MDV4LWNjIGJvYXJkLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEx1a2UgTHUgPGx1a2UubHVAbGlicmUuY29tcHV0ZXI+Cj4KPiBXaGF0IGNvbW1pdCBpZCBk
b2VzIHRoaXMgZml4PwpVc2luZyAiZ2l0IGJsYW1lIiB0byBleHBsb3JlIHRoZSBoaXN0b3J5LCBm
b3VuZCBkd2MzX21lc29uX2cxMmFfcmVzdW1lKCkgd2FzCmludHJvZHVjZWQgYWxvbmcgd2l0aCB0
aGUgZmlsZSBvZiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jLgphcyBEYSBYdWUg
cG9pbnRlZCBvdXQsIHRoZSBzdXNwZW5kL3Jlc3VtZSB3YXMgbmV2ZXIgdGVzdGVkIGluIEdYTCBi
YXNlZCBTb0MsCnNvIGl0J3MgYnJva2VuIHNpbmNlIHRoZSBiZWdpbm5pbmcuLgoKRm9yIHRoZSBG
aXhlcyB0YWcsIEkgdGhpbmsgaXQncyBwcm9wZXIgdG8gdXNlICI1YjBiYTBjYWFmM2E6ICh1c2I6
CmR3YzM6IG1lc29uLWcxMmE6IHJlZmFjdG9yIHVzYiBpbml0KSIKc2luY2UgdGhlIHVzYl9wb3N0
X2luaXQoKSBmdW5jdGlvbiB3YXMgaW50cm9kdWNlZCBpbiB0aGlzIGNvbW1pdCBhbmQKdGhpcyBw
YXRjaCB3aWxsIGRlcGVuZCBvbiBpdC4KCj4gU2hvdWxkIGl0IGFsc28gZ28gdG8gc3RhYmxlIGtl
cm5lbHM/Cj4KWWVzLCBJdCB3b3VsZCBiZSBncmVhdCBpZiB0aGUgcGF0Y2ggY2FuIGdvIHRvIHN0
YWJsZSB0cmVlLCB0aGFua3MgZm9yCnN1Z2dlc3RpbmcgdGhpcwpJIGhhdmUgaXQgdGVzdGVkIG9u
IDYuMS1sdHMgdHJlZS4KCkJ0dywgSSB3b3VsZCB3YWl0IGZvciBhIGZldyBkYXlzIGZvciBtb3Jl
IGNvbW1lbnRzIGFuZCBDQyB0byBzdGFibGUgaW4KbmV4dCB2MiBpZiBubyBvYmplY3Rpb24uCgo+
IHRoYW5rcywKPgo+IGdyZWcgay1oCgpMdWtlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
