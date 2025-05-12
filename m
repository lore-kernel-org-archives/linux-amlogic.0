Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69716C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 May 2025 10:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdegnNl7LXd0K8uw48AtmR+NyOz0ykcPD1E84D3gM5k=; b=13tywvzRHMG8Ln
	YWvoDQYf/ZQxFauCsXFcuIoHHoWf+oZLiwC8Nc0TJB/5iFyf5F0RXPSu7ltHSH/ckqd++okFZJk3n
	ED95VJ+wuU942uIsgTTQQwcwq8nvi9ESOOXEXEntG0be1q+oAfXf6Ku0k++jWbM8OKb+CRzE78Rx7
	CUE70XE+d6CKYOaBP8wmkWqqdNrfkIK/DAKCE6wZ5YLu6VvmXJpH5E8NviAiHFSJ8Xgl9eFA5V1ed
	KPLHXSfuE6B9m/qxIMZNP0Af2XduElSZz9JF7v4zN2D721EWeKwl4x8zEWXcSpP4pFwEP50GDqVtP
	PddCIU6BS/KnH0BOOxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQNT-000000095xE-2Na7;
	Mon, 12 May 2025 10:27:19 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEQ1W-000000093NZ-0MKS
	for linux-amlogic@lists.infradead.org;
	Mon, 12 May 2025 10:04:39 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ad241baf856so292786866b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 May 2025 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747044276; x=1747649076; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7wqUmeQxImZo9I4UjDMb0Yuabns1sdp2FRzB39Gx70=;
        b=WxN8Oullg7DCIxtmJtpA7HqWJaMCWapI0jtQrkE3hiejRL1ixyvXnojqqWPtO4ZriY
         fjfZigJL6f/golF7pGVeWi0uIB3bB1THrDuR0v7Y3bvAnMb+b+8zJYvwdRGAy9Rdvb8I
         sFR9f2OTGqTk4cl2T/Co3F3balz6WfC1TlL92YDd0pszFyCEsZCK+5UAw3Frv6xU+KJt
         eK7aRPJZkbypKVnCEoTIDuJFvEePaTlC8pGrGYQfP0B6rZRajOL5tIFxa5vwwdpvRdQ1
         E0FrLJtGL/t/BLwTJi6Wj6oCcEeRcz/CS6wQOsL+4jXAsnSM7oeqRLc32dC5jOv2b/EC
         CXPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747044276; x=1747649076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7wqUmeQxImZo9I4UjDMb0Yuabns1sdp2FRzB39Gx70=;
        b=pZax8WPgnik/bE0/YB6uNRqKBtuYmQPOzRxj3PzJ6n+XfWF3EjEIrpINu4L5K0BVsY
         J0tffnHx0Atacetz0vzkNF/QhDDIRdKQfS9npd6rQfKmcbeq4fXGY6YpqqA7df6g12ey
         EV/u+I4johxZbpnbo6ffq8cwu+kJpWkuHUUb0AcKQJLcWi6G7DpYB1Gcu03svTVHTD8Z
         XdutuVuKhzdZB0UT01AA9kKyMxWBmHMn7+V3DL7ozW4N2wjP2UswMDrmFssoSH1W9wT3
         3x2135iz50UCNKveqtvB5OM1YiqI461XIHwLH8+UXJshczNqO89FfnvIMvUNkkTrLlcH
         hjGA==
X-Forwarded-Encrypted: i=1; AJvYcCUeIRzHBWcpl6njoflwDu/yTwbdLuJsNRRg0CaEnNaLce03RBxLjIcMGf2rqbo/0PHXqwv0u8uYsh40J8b7@lists.infradead.org
X-Gm-Message-State: AOJu0YwVR0bmZ1v2Hx+2LewjLOghQq3C2q3rniW3BSZKn+0fB4eFOHM1
	kEfhLeM4GfwHFPgEGlXW8L7UoR/MhKCsfeDLXmv199YK3KjRILzWsTU+j4jZ+awMPj7bcYlm/E5
	rewouLXzW0jiFEj55aBJyBpNhXqA=
X-Gm-Gg: ASbGnct6GG6zJoXW47c9gDNnZ0LjUzNp75Y5lKX/9DBQyDLeEuyXxnEjcOhVd9cA04L
	X7+sx8cywPbddDOxBF5LQN0zQ/64+6GZxRMIFCov1nF50LyppLj0gjcg0LP3jZEV8VDJBYxyX9N
	1U0RNrl13o4mX3EIHUMDj6530YutQuJV4=
X-Google-Smtp-Source: AGHT+IFa00fBbASZiwwzqM5ZvytS2NjW0Pi9nonQttu1kOtUwY1W98EiZyn0wzjG8V4b10zs8cDhHYC7NRv5OTm1olA=
X-Received: by 2002:a17:907:980f:b0:ad2:5212:5e87 with SMTP id
 a640c23a62f3a-ad252126162mr354983066b.16.1747044276051; Mon, 12 May 2025
 03:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org> <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
 <D9QX0MRWSYW6.3ELRB73BS6PRT@postmarketos.org> <CAEUiLuYW61Vz4zAie2K9cnXXQxxRj150Nc-fJMQCh9NwXZQmzQ@mail.gmail.com>
 <CANAwSgRkqAj5Q4LMO-CKBSoMgO-+zd6JpbVs+eWY3kPgmj9bug@mail.gmail.com>
 <CAEUiLubakMjzhi2sUTQx1S4ciTjkL6ysx465i1t-T5zKUQdUvw@mail.gmail.com>
 <CAEUiLuY2D_CzkEH0+gCvkbC_MtJ4B-MLYYkx_r2E9BHxPvuVjg@mail.gmail.com>
 <CANAwSgRvtgsejhsj=TyRAYWdQRfGRigvw9+=HzcdxbDopoiFYw@mail.gmail.com> <7BAB0A37-3DA8-4FC9-AFFE-7CAE6FA92367@gmail.com>
In-Reply-To: <7BAB0A37-3DA8-4FC9-AFFE-7CAE6FA92367@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 12 May 2025 15:34:21 +0530
X-Gm-Features: AX0GCFvF7325CEN4o8poH8aCEiTW3B4cGtpSuk-e07uajOPJy3vAypccAc3rTK4
Message-ID: <CANAwSgTtU2oe4jwJySGk7wq3QqShuyUedFjeUrE-VRi=uH1_TQ@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: u-boot-amlogic@groups.io, Wayne Schroeder <raz@chewies.net>, 
	Ferass El Hafidi <funderscore@postmarketos.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	u-boot@lists.denx.de, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_030438_126268_0E2FA962 
X-CRM114-Status: GOOD (  39.86  )
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

SGkgQ2hyaXN0aWFuLAoKT24gTW9uLCAxMiBNYXkgMjAyNSBhdCAxNTowNSwgQ2hyaXN0aWFuIEhl
d2l0dAo8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBPbiAxMiBNYXkg
MjAyNSwgYXQgMTA6NTnigK9hbSwgQW5hbmQgTW9vbiB2aWEgZ3JvdXBzLmlvIDxsaW51eC5hbW9v
bj1nbWFpbC5jb21AZ3JvdXBzLmlvPiB3cm90ZToKPiA+Cj4gPiBIaSBXYXluZSwKPiA+Cj4gPiBP
biBTdW4sIDExIE1heSAyMDI1IGF0IDAxOjUxLCBXYXluZSBTY2hyb2VkZXIgPHJhekBjaGV3aWVz
Lm5ldD4gd3JvdGU6Cj4gPj4KPiA+PiBBcHBsaWVkIHBhdGNoZXMgdG8gMjAyNS4wNCByZWxlYXNl
IChhcHBsaWVkIGNsZWFuKS4gIE1hZGUgc3RvY2sKPiA+PiBkZWZjb25maWcgZm9yIG9kcm9pZCBu
MiwgYnVpbHQsIHNpZ25lZCwgaW5zdGFsbGVkLiAgVGhlIHJlYm9vdCBpc3N1ZQo+ID4+IHJlbWFp
bnMgYW5kIHVzYiBwb3J0cyBhcmUgdW5hdmFpbGFibGUgdG8gbGludXgga2VybmVsIGFmdGVyIHJl
Ym9vdC4KPiA+Pgo+ID4+IEl0IGlzIHdvcnRoIG5vdGluZyB0aGF0IGxpbnV4IGRvZXMgc2VlIHNv
bWUgZW51bWVyYXRpb24gb2YgZGV2aWNlcwo+ID4+IGFmdGVyIGEgd2hpbGUsIGJ1dCBldmVuIGlm
IGl0IGxvZ3MgdG8gdGhlIGNvbnNvbGUgYWJvdXQgZGV2aWNlCj4gPj4gYXR0YWNobWVudCwgdGhl
IGRldmljZXMgZG9uJ3QgYWN0dWFsbHkgZnVuY3Rpb24uICBUaGlzIHdhcyB0aGUgc2FtZQo+ID4+
IGJlaGF2aW9yIHdpdGggdGhlIHJlbGVhc2UgdmVyc2lvbi4KPiA+Pgo+ID4gVGhhbmtzIGZvciB0
ZXN0aW5nIHRoZXNlIHBhdGNoZXMuCj4gPiBXZSBuZWVkIHRvIG1vZGlmeSB0aGUgYm9vdCBvcmRl
ciB0byBwcm9iZSBVU0IgYmVmb3JlIE1NQwo+Cj4gV2h5PyBNb3N0IEFtbG9naWMgYm9hcmRzIGJv
b3QgZnJvbSBhbiBtbWMgZGV2aWNlIChTRCBvciBpbnRlcm5hbCBmbGFzaAo+IHN0b3JhZ2UpIG5v
dCBVU0IuIEl0IHNtZWxscyBsaWtlIGEgd29ya2Fyb3VuZCBub3QgYSBmaXgsIGFuZCBJIHdvbmRl
cgo+IHdoYXQgdGhlIHBlcmZvcm1hbmNlIGltcGFjdCBvbiBib290IHdpbGwgYmU/Cj4KSSdtIHBy
b3ZpZGluZyBhIHNvbHV0aW9uIHRoYXQgbWF5IG5vdCBhcHBseSB0byBhbGwgQW1sb2dpYyBib2Fy
ZHMuClRoZSBnb2FsIGlzIHRvIGVuc3VyZSB0aGUgVVNCIGRldmljZSBiaW5kcyBlYXJseSwgYWxs
b3dpbmcgdGhlIFVTQiBrZXlib2FyZAphbmQgbWFzcyBzdG9yYWdlIGRldmljZSB0byBiZSBkZXRl
Y3RlZCBwcm9tcHRseS4KSG93ZXZlciwgSSdtIHVuc3VyZSBpZiBib290aW5nIGZyb20gVVNCIG1h
c3Mgc3RvcmFnZSBpcyBzdXBwb3J0ZWQuCgpUaGFua3MKLUFuYW5kCj4gQ2hyaXN0aWFuCj4KPiA+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2NvbmZpZ3MvbWVzb242NC5oIGIvaW5jbHVkZS9jb25maWdz
L21lc29uNjQuaAo+ID4gaW5kZXggZjMyNzViMzdhNTEuLjNhY2U1OTg4MGJkIDEwMDY0NAo+ID4g
LS0tIGEvaW5jbHVkZS9jb25maWdzL21lc29uNjQuaAo+ID4gKysrIGIvaW5jbHVkZS9jb25maWdz
L21lc29uNjQuaAo+ID4gQEAgLTExOSw4ICsxMTksOCBAQAo+ID4gI2RlZmluZSBCT09UX1RBUkdF
VF9ERVZJQ0VTKGZ1bmMpIFwKPiA+ICAgICAgICBmdW5jKFJPTVVTQiwgcm9tdXNiLCBuYSkgIFwK
PiA+ICAgICAgICBmdW5jKFVTQl9ERlUsIHVzYmRmdSwgbmEpICBcCj4gPiAtICAgICAgIEJPT1Rf
VEFSR0VUX01NQyhmdW5jKSBcCj4gPiAgICAgICAgQk9PVF9UQVJHRVRfREVWSUNFU19VU0IoZnVu
YykgXAo+ID4gKyAgICAgICBCT09UX1RBUkdFVF9NTUMoZnVuYykgXAo+ID4gICAgICAgIEJPT1Rf
VEFSR0VUX05WTUUoZnVuYykgXAo+ID4gICAgICAgIEJPT1RfVEFSR0VUX1NDU0koZnVuYykgXAo+
ID4gICAgICAgIEJPT1RfVEFSR0VUX1BYRShmdW5jKSBcCj4gPgo+ID4gSGVyZSBpcyB0aGUgYm9v
dCBzZXF1ZW5jZSBhdCBteSBlbmQuCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+IFUt
Qm9vdCAyMDI1LjA3LXJjMS0wMDIyMy1nNzA0YTRkMWZkODA0IChNYXkgMTIgMjAyNSAtIDEyOjE1
OjI5ICswNTMwKQo+ID4gb2Ryb2lkLW4yL24yLXBsdXMKPiA+Cj4gPiBNb2RlbDogSGFyZGtlcm5l
bCBPRFJPSUQtTjIKPiA+IFNvQzogICBBbWxvZ2ljIE1lc29uIEcxMkIgKFM5MjJYKSBSZXZpc2lv
biAyOTpjICg0MDoyKQo+ID4gRFJBTTogIDEgR2lCICh0b3RhbCAzLjggR2lCKQo+ID4gQ29yZTog
IDQwMiBkZXZpY2VzLCAzMCB1Y2xhc3NlcywgZGV2aWNldHJlZTogc2VwYXJhdGUKPiA+IE1NQzog
ICBtbWNAZmZlMDUwMDA6IDAsIG1tY0BmZmUwNzAwMDogMQo+ID4gTG9hZGluZyBFbnZpcm9ubWVu
dCBmcm9tIG5vd2hlcmUuLi4gT0sKPiA+IEluOiAgICB1c2JrYmQsc2VyaWFsCj4gPiBPdXQ6ICAg
dmlkY29uc29sZSxzZXJpYWwKPiA+IEVycjogICB2aWRjb25zb2xlLHNlcmlhbAo+ID4gQm9hcmQg
dmFyaWFudDogbjItcGx1cwo+ID4gTmV0OiAgIGV0aDA6IGV0aGVybmV0QGZmM2YwMDAwCj4gPgo+
ID4gSGl0IGFueSBrZXkgdG8gc3RvcCBhdXRvYm9vdDogIDAKPiA+IHN0YXJ0aW5nIFVTQi4uLgo+
ID4gUmVnaXN0ZXIgMzAwMDE0MCBOYnJQb3J0cyAzCj4gPiBTdGFydGluZyB0aGUgY29udHJvbGxl
cgo+ID4gVVNCIFhIQ0kgMS4xMAo+ID4gQnVzIHVzYkBmZjUwMDAwMDogNCBVU0IgRGV2aWNlKHMp
IGZvdW5kCj4gPiAgICAgICBzY2FubmluZyB1c2IgZm9yIHN0b3JhZ2UgZGV2aWNlcy4uLiAxIFN0
b3JhZ2UgRGV2aWNlKHMpIGZvdW5kCj4gPgo+ID4gRGV2aWNlIDA6IFZlbmRvcjogQVNNVCAgICAg
UmV2OiAwICAgIFByb2Q6IDIxMTUKPiA+ICAgICAgICAgICAgVHlwZTogSGFyZCBEaXNrCj4gPiAg
ICAgICAgICAgIENhcGFjaXR5OiAxMTQ0NzMuNCBNQiA9IDExMS43IEdCICgyMzQ0NDE2NDggeCA1
MTIpCj4gPiAuLi4gaXMgbm93IGN1cnJlbnQgZGV2aWNlCj4gPiBTY2FubmluZyB1c2IgMDoxLi4u
Cj4gPiBDYXJkIGRpZCBub3QgcmVzcG9uZCB0byB2b2x0YWdlIHNlbGVjdCEgOiAtMTEwCj4gPiBD
YW5ub3QgcGVyc2lzdCBFRkkgdmFyaWFibGVzIHdpdGhvdXQgc3lzdGVtIHBhcnRpdGlvbgo+ID4g
TG9hZGluZyBCb290MDAwMCAnbW1jIDEnIGZhaWxlZAo+ID4gTG9hZGluZyBCb290MDAwMSAndXNi
IDAnIGZhaWxlZAo+ID4gRUZJIGJvb3QgbWFuYWdlcjogQ2Fubm90IGxvYWQgYW55IGltYWdlCj4g
PiBDYXJkIGRpZCBub3QgcmVzcG9uZCB0byB2b2x0YWdlIHNlbGVjdCEgOiAtMTEwCj4gPiBzd2l0
Y2ggdG8gcGFydGl0aW9ucyAjMCwgT0sKPiA+IG1tYzEocGFydCAwKSBpcyBjdXJyZW50IGRldmlj
ZQo+ID4gU2Nhbm5pbmcgbW1jIDE6MS4uLgo+ID4gRm91bmQgL2V4dGxpbnV4L2V4dGxpbnV4LmNv
bmYKPiA+IFJldHJpZXZpbmcgZmlsZTogL2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYKPiA+IDE6ICAg
ICAgTWFuamFybyBBUk0KPiA+IFJldHJpZXZpbmcgZmlsZTogL0ltYWdlCj4gPiBSZXRyaWV2aW5n
IGZpbGU6IC9pbml0cmFtZnMtbGludXguaW1nCj4gPiBhcHBlbmQ6IGluaXRyZD0vaW5pdHJhbWZz
LWxpbnV4LmltZyBjb25zb2xlPXR0eUFNTDAsMTE1MjAwbjgKPiA+IHJvb3Q9UEFSVFVVSUQ9MGVm
YzdjMzYtMDIgcm9vdHdhaXQgYXVkaXQ9MCBjbGtfaWdub3JlX3VudXNlZAo+ID4gcGx5bW91dGgu
aWdub3JlLXNlcmlhbC1jb25zb2xlcwo+ID4KPiA+PiBXYXluZQo+ID4+Cj4gPj4gT24gRnJpLCBN
YXkgOSwgMjAyNSBhdCAxMDowMeKAr0FNIFdheW5lIFNjaHJvZWRlciA8cmF6QGNoZXdpZXMubmV0
PiB3cm90ZToKPiA+Pj4KPiA+Pj4gWWVzLiAgV2lsbCByZXBvcnQgYmFjayBob3cgaXQgd29ya3Mg
b24gdGhlIG4yKy4KPiA+Pj4KPiA+Pj4KPiA+Pj4gT24gRnJpLCBNYXkgOSwgMjAyNSBhdCAyOjA4
4oCvQU0gQW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPiB3cm90ZToKPiA+Pj4+Cj4g
Pj4+PiBIaSBXYXluZSwKPiA+Pj4+Cj4gPj4+PiBPbiBGcmksIDkgTWF5IDIwMjUgYXQgMDE6MjUs
IFdheW5lIFNjaHJvZWRlciA8cmF6QGNoZXdpZXMubmV0PiB3cm90ZToKPiA+Pj4+Pgo+ID4+Pj4+
IEkgYWN0dWFsbHkgYWxyZWFkeSBoYXZlIGEgd29ya2luZyBzb2x1dGlvbiB0aGF0IEkgZG9jdW1l
bnRlZCBpbiBteQo+ID4+Pj4+IGdpdGh1YiByZXBvIChkdWJzY2hyby9vZHJvaWQtbjIpLiAgQWxs
IEkgZG8gaXMgc2V0IEJPT1RDT01NQU5EIHRvCj4gPj4+Pj4gY2hlY2svZGVsZXRlIGEgZmxhZyBm
aWxlIG9uIG15IGJvb3QgcGFydGl0aW9uIGFuZCBpZiBpdCBpcyBmb3VuZCwgdGhlbgo+ID4+Pj4+
IHJlc2V0IHVzYiBhbmQgc2xlZXAgZm9yIDEwIHNlY29uZHMuICBJIHRoZW4gaGF2ZSBhIHN5c3Rl
bWQgc2h1dGRvd24KPiA+Pj4+PiBzY3JpcHQgb25seSBvbiByZWJvb3QgdG8gdG91Y2ggdGhhdCBm
aWxlLgo+ID4+Pj4+Cj4gPj4+Pj4gQ09ORklHX0JPT1RDT01NQU5EPSJmYXRybSBtbWMgMDoxIHJl
Ym9vdCAmJiBlY2hvIFJlc2V0dGluZyBVU0Igb24KPiA+Pj4+PiByZWJvb3QuLi4gJiYgdXNiIHJl
c2V0ICYmIHNsZWVwIDEwOyBydW4gZGlzdHJvX2Jvb3RjbWQiCj4gPj4+Pj4KPiA+Pj4+PiBJdCBp
cyBhIGhhY2ssIGJ1dC4uLiB0aGUgc3lzdGVtIHJlbGlhYmx5IHJlYm9vdHMgcmVtb3RlbHkgbm93
LCBhbmQKPiA+Pj4+PiB0aGF0J3MgdGhlIGltcG9ydGFudCBwYXJ0IGZvciBub3cuCj4gPj4+Pj4K
PiA+Pj4+PiBXYXluZQo+ID4gSSBkaWQgbm90IG1vZGlmeSB0aGlzIGF0IG15IGVuZC4gSG93ZXZl
ciwgdGhpcyBpcyBub3QgcmVxdWlyZWQgd2l0aAo+ID4gdGhlIGFib3ZlIGZpeC4KPiA+Cj4gPiBU
aGFua3MKPiA+IC1BbmFuZAo+ID4+Pj4+Cj4gPj4+Pj4gT24gVGh1LCBNYXkgOCwgMjAyNSBhdCAx
MToyMuKAr0FNIEZlcmFzcyBFbCBIYWZpZGkKPiA+Pj4+PiA8ZnVuZGVyc2NvcmVAcG9zdG1hcmtl
dG9zLm9yZz4gd3JvdGU6Cj4gPj4+Pj4+Cj4gPj4+Pj4+IE9uIFdlZCBNYXkgNywgMjAyNSBhdCAx
OjAzIFBNIFVUQywgV2F5bmUgU2Nocm9lZGVyIHdyb3RlOgo+ID4+Pj4+Pj4gSXQncyBoYXJkIGZv
ciBtZSB0byBxdWFudGlmeSBpZiB1c2Igd29ya3MgaW4gdS1ib290IGFzIEknbSBub3QgbG9hZGlu
Zwo+ID4+Pj4+Pj4gb2ZmIG9mIGFueSB1c2Igc3RvcmFnZSBkZXZpY2VzLiAgSXQgY2VydGFpbmx5
IG5ldmVyIGxldHMgbWUgdXNlIHRoZQo+ID4+Pj4+Pj4ga2V5Ym9hcmQgdG8gYWJvcnQgYXV0byBi
b290LCBhbmQgbmV2ZXIgaGFzLiAgT24gcmVib290LCB0byByZWxpYWJseQo+ID4+Pj4+Pgo+ID4+
Pj4+PiBZb3UgY2FuIHNlbmQgYnl0ZXMgdmlhIFVBUlQgdG8gYWJvcnQgYm9vdCwgaWYgeW91IGhh
cHBlbiB0byBoYXZlIGEgVUFSVAo+ID4+Pj4+PiBhZGFwdGVyIGFyb3VuZC4KPiA+Pj4+Pgo+ID4+
Pj4gQ2FuIHlvdSB0ZXN0IHRoaXMgc2VyaWVzIHRvIHNlZSBpZiB0aGlzIHJlc29sdmVzIHRoZSBp
c3N1ZT8KPiA+Pj4+Cj4gPj4+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
dWJvb3QvbGlzdC8/c2VyaWVzPTQ1NjA4OAo+ID4+Pj4KPiA+Pj4+IFRoYW5rcwo+ID4+Pj4gLUFu
YW5kCj4gPj4+Pgo+ID4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gPj4+Pj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiA+Pj4+PiBsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+Pj4+PiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKPiA+Cj4gPgo+ID4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0KPiA+IEdyb3Vwcy5pbyBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1l
c3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4KPiA+IFZpZXcvUmVwbHkgT25saW5lICgjMjY5Nik6
IGh0dHBzOi8vZ3JvdXBzLmlvL2cvdS1ib290LWFtbG9naWMvbWVzc2FnZS8yNjk2Cj4gPiBNdXRl
IFRoaXMgVG9waWM6IGh0dHBzOi8vZ3JvdXBzLmlvL210LzExMjYyNTQzNS82NDA3MzIzCj4gPiBH
cm91cCBPd25lcjogdS1ib290LWFtbG9naWMrb3duZXJAZ3JvdXBzLmlvCj4gPiBVbnN1YnNjcmli
ZTogaHR0cHM6Ly9ncm91cHMuaW8vZy91LWJvb3QtYW1sb2dpYy91bnN1YiBbY2hyaXN0aWFuc2hl
d2l0dEBnbWFpbC5jb21dCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFp
bGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
