Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABA5EB64D8
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 17:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqI6lfjcfnpVPDXiQzqZhn3AQDRBdnDHHCh3opcwDEw=; b=zGWbgCfFL8aXsm
	+x94u4UWUMegO29r9QJZl8LducsE1eI+Hu8kt/KF9mkkmtB66lmOyo3JaIzhZvRzBwDuCUIz5YdgW
	TII5VxE7oWppfaMrpWYfjfTDCPvcssygndx1srrQE0oYDZy546lkTakS3/KfQj5+G/XpLeSxK04gm
	dJd1shFTWTL6rW6IwnzdX26ZAyY1Sbr42NWlF2NEQijaQo/C0xQtp3a+CqHh2YiYRJfpgMxrVb2OD
	vHdmt/ukmfZ7XKxLmFf+5Zn0aRgT7X3Rpo+bx3PUnbihXq5J1PYazepL4otp2qFw8NMKa0bU+1x5E
	Is/9qdTceL2Bebgk21Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwQb-006PgO-07;
	Sun, 18 Jun 2023 17:43:05 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAwQX-006Pfb-2J;
	Sun, 18 Jun 2023 17:43:03 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-570808d8ddeso24479767b3.0;
        Sun, 18 Jun 2023 10:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687110180; x=1689702180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLpx9nbtGApdAP3oWuubaSztjg6fg3+1+MFFJiCzVks=;
        b=K8xkabiW2Ke0BVDNnV/zXarUoHL0FHFJOdiNyQ/dqmgwidNxz54fToQCefJvRk4kN1
         XNXrGO40FThV9eSM93xoYHwFMX4aaKdZbKXY2So9DLk13DKIVVa2HMZq7xTVWEoZsHsJ
         KO7lhl5ddCYUKJgDKUpQio7dzwry26T5ZbwdIWJtk5I9CdnkRSfrUaweeibxSrLMbQ1E
         cezzl9lbwr59BF7ggQE4vTHUSKjfNeefF7IKSbcsajQH6QPqHl670Fgcb8ILXsCyUNd7
         0/+QsOb+220vJK6V5Qtt2yXkGOgiSacn7M6VKZfqwgh9zBuYc2xSbXPzcYTa39E0ruE0
         wnLQ==
X-Gm-Message-State: AC+VfDzx6/eVBUFYe6cCXP2FFjjNJ9bCyPANcsq+QrQAai83zw0GCMIA
	nFLcJQEC9vMqMP+9ZL+GlO0kU9DCdCIpAyq2
X-Google-Smtp-Source: ACHHUZ59WzI4RiB+WNm+KjrpU/DPc+imK4y8XLO7H9U93yMY8/EAfqqPSAI9cyYJzpc4Qed/zoOn3Q==
X-Received: by 2002:a0d:dd88:0:b0:561:9d66:e1a with SMTP id g130-20020a0ddd88000000b005619d660e1amr8756234ywe.34.1687110180399;
        Sun, 18 Jun 2023 10:43:00 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id s189-20020a0dd0c6000000b005732b228a83sm592121ywd.140.2023.06.18.10.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 10:42:59 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-57012b2973eso34088477b3.2;
        Sun, 18 Jun 2023 10:42:58 -0700 (PDT)
X-Received: by 2002:a81:a0d3:0:b0:56c:ff9d:8cd9 with SMTP id
 x202-20020a81a0d3000000b0056cff9d8cd9mr8570801ywg.7.1687110178437; Sun, 18
 Jun 2023 10:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230615182938.18487-4-tanure@linux.com> <202306161946.Kk7xeos8-lkp@intel.com>
In-Reply-To: <202306161946.Kk7xeos8-lkp@intel.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 18 Jun 2023 18:42:47 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2Jr4CHHbzy+d5wNgrEsU__EFQr_y0PZvLdb-uEp+H6eA@mail.gmail.com>
Message-ID: <CAJX_Q+2Jr4CHHbzy+d5wNgrEsU__EFQr_y0PZvLdb-uEp+H6eA@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev, 
	Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_104301_758585_33B77527 
X-CRM114-Status: GOOD (  21.49  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdW4gMTYsIDIwMjMgYXQgMTI6MjPigK9QTSBrZXJuZWwgdGVzdCByb2JvdCA8bGtw
QGludGVsLmNvbT4gd3JvdGU6Cj4KPiBIaSBMdWNhcywKPgo+IGtlcm5lbCB0ZXN0IHJvYm90IG5v
dGljZWQgdGhlIGZvbGxvd2luZyBidWlsZCB3YXJuaW5nczoKPgo+IFthdXRvIGJ1aWxkIHRlc3Qg
V0FSTklORyBvbiByb2JoL2Zvci1uZXh0XQo+IFthbHNvIGJ1aWxkIHRlc3QgV0FSTklORyBvbiBj
bGsvY2xrLW5leHQgdHR5L3R0eS10ZXN0aW5nIHR0eS90dHktbmV4dCB0dHkvdHR5LWxpbnVzIGty
emsvZm9yLW5leHQga3J6ay1kdC9mb3ItbmV4dCBrcnprLW1lbS1jdHJsL2Zvci1uZXh0IGxpbnVz
L21hc3RlciB2Ni40LXJjNiBuZXh0LTIwMjMwNjE2XQo+IFtJZiB5b3VyIHBhdGNoIGlzIGFwcGxp
ZWQgdG8gdGhlIHdyb25nIGdpdCB0cmVlLCBraW5kbHkgZHJvcCB1cyBhIG5vdGUuCj4gQW5kIHdo
ZW4gc3VibWl0dGluZyBwYXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1l
bnRlZCBpbgo+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNl
X3RyZWVfaW5mb3JtYXRpb25dCj4KPiB1cmw6ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC1s
YWItbGtwL2xpbnV4L2NvbW1pdHMvTHVjYXMtVGFudXJlL2R0LWJpbmRpbmdzLWFybS1hbWxvZ2lj
LWFkZC1BbWxvZ2ljLVQ3LWJhc2VkLUtoYWRhcy1WSU00LWJpbmRpbmdzLzIwMjMwNjE2LTAyMzAz
OAo+IGJhc2U6ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcm9iaC9saW51eC5naXQgZm9yLW5leHQKPiBwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9yLzIwMjMwNjE1MTgyOTM4LjE4NDg3LTQtdGFudXJlJTQwbGludXguY29tCj4g
cGF0Y2ggc3ViamVjdDogW1BBVENIIDMvNl0gY2xrOiBtZXNvbjogdDc6IGFkZCBwZXJpcGhlcmFs
IGNsb2NrIGNvbnRyb2xsZXIKPiBjb25maWc6IGFybTY0LWJ1aWxkb25seS1yYW5kY29uZmlnLXIw
MDQtMjAyMzA2MTUgKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIz
MDYxNi8yMDIzMDYxNjE5NDYuS2s3eGVvczgtbGtwQGludGVsLmNvbS9jb25maWcpCj4gY29tcGls
ZXI6IGFhcmNoNjQtbGludXgtZ2NjIChHQ0MpIDEyLjMuMAo+IHJlcHJvZHVjZTogKGh0dHBzOi8v
ZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDYxNi8yMDIzMDYxNjE5NDYuS2s3
eGVvczgtbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpCj4KPiBJZiB5b3UgZml4IHRoZSBpc3N1ZSBp
biBhIHNlcGFyYXRlIHBhdGNoL2NvbW1pdCAoaS5lLiBub3QganVzdCBhIG5ldyB2ZXJzaW9uIG9m
Cj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwo+IHwg
UmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IHwgQ2xvc2Vz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMwNjE2MTk0Ni5Lazd4
ZW9zOC1sa3BAaW50ZWwuY29tLwo+Cj4gQWxsIHdhcm5pbmdzIChuZXcgb25lcyBwcmVmaXhlZCBi
eSA+Pik6Cj4KPiAgICBkcml2ZXJzL2Nsay9tZXNvbi90Ny5jOjcwODQ6NTE6IHdhcm5pbmc6IGlu
aXRpYWxpemVkIGZpZWxkIG92ZXJ3cml0dGVuIFstV292ZXJyaWRlLWluaXRdCj4gICAgIDcwODQg
fCAgICAgICAgICAgICAgICAgW0NMS0lEX1ZJRF9QTExdICAgICAgICAgICAgICAgICA9ICZ0N192
aWRfcGxsLmh3LAo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeCj4gICAgZHJpdmVycy9jbGsvbWVzb24vdDcuYzo3MDg0OjUxOiBu
b3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3IgJ3Q3X2h3X29uZWNlbGxfZGF0YS5od3NbOTNd
JykKPiAgICBkcml2ZXJzL2Nsay9tZXNvbi90Ny5jOiBJbiBmdW5jdGlvbiAnbWVzb25fdDdfcHJv
YmUnOgo+ID4+IGRyaXZlcnMvY2xrL21lc29uL3Q3LmM6Nzk0NjozNjogd2FybmluZzogdmFyaWFi
bGUgJ21jbGtfZGF0YScgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJs
ZV0KPiAgICAgNzk0NiB8ICAgICAgICAgc3RydWN0IG1lc29uX2Nsa19wbGxfZGF0YSAqbWNsa19k
YXRhOwo+ICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+
fn5+fn4KPiAgICBkcml2ZXJzL2Nsay9tZXNvbi90Ny5jOiBBdCB0b3AgbGV2ZWw6Cj4gICAgZHJp
dmVycy9jbGsvbWVzb24vdDcuYzo2ODk6Mzc6IHdhcm5pbmc6ICd0N19hNzNfZHluX2Nsa19zZWwn
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gICAgICA2
ODkgfCBzdGF0aWMgY29uc3Qgc3RydWN0IGNsa19wYXJlbnRfZGF0YSB0N19hNzNfZHluX2Nsa19z
ZWxbXSA9IHsKPiAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fgo+ICAgIGRyaXZlcnMvY2xrL21lc29uL3Q3LmM6OTM6Mjk6IHdh
cm5pbmc6ICdtZXNvbl9wbGxfY2xrX25vX29wcycgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51
c2VkLWNvbnN0LXZhcmlhYmxlPV0KPiAgICAgICA5MyB8IHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xr
X29wcyBtZXNvbl9wbGxfY2xrX25vX29wcyA9IHt9Owo+ICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4KPgo+IHZpbSArL21jbGtfZGF0
YSArNzk0NiBkcml2ZXJzL2Nsay9tZXNvbi90Ny5jCj4KPiAgIDc5MzkKPiAgIDc5NDAgIHN0YXRp
YyBpbnQgX19yZWYgbWVzb25fdDdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgIDc5NDEgIHsKPiAgIDc5NDIgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsKPiAgIDc5NDMgICAgICAgICAgc3RydWN0IHJlZ21hcCAqYmFzaWNfbWFwOwo+ICAgNzk0
NCAgICAgICAgICBzdHJ1Y3QgcmVnbWFwICpwbGxfbWFwOwo+ICAgNzk0NSAgICAgICAgICBzdHJ1
Y3QgcmVnbWFwICpjcHVfY2xrX21hcDsKPiA+IDc5NDYgICAgICAgICAgc3RydWN0IG1lc29uX2Ns
a19wbGxfZGF0YSAqbWNsa19kYXRhOwo+ICAgNzk0NyAgICAgICAgICBpbnQgcmV0LCBpOwo+ICAg
Nzk0OAo+ICAgNzk0OSAgICAgICAgICAvKiBHZXQgcmVnbWFwIGZvciBkaWZmZXJlbnQgY2xvY2sg
YXJlYSAqLwo+ICAgNzk1MCAgICAgICAgICBiYXNpY19tYXAgPSB0N19yZWdtYXBfcmVzb3VyY2Uo
ZGV2LCAiYmFzaWMiKTsKPiAgIDc5NTEgICAgICAgICAgaWYgKElTX0VSUihiYXNpY19tYXApKSB7
Cj4gICA3OTUyICAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJiYXNpYyBjbGsgcmVnaXN0
ZXJzIG5vdCBmb3VuZFxuIik7Cj4gICA3OTUzICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9F
UlIoYmFzaWNfbWFwKTsKPiAgIDc5NTQgICAgICAgICAgfQo+ICAgNzk1NQo+ICAgNzk1NiAgICAg
ICAgICBwbGxfbWFwID0gdDdfcmVnbWFwX3Jlc291cmNlKGRldiwgInBsbCIpOwo+ICAgNzk1NyAg
ICAgICAgICBpZiAoSVNfRVJSKHBsbF9tYXApKSB7Cj4gICA3OTU4ICAgICAgICAgICAgICAgICAg
ZGV2X2VycihkZXYsICJwbGwgY2xrIHJlZ2lzdGVycyBub3QgZm91bmRcbiIpOwo+ICAgNzk1OSAg
ICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHBsbF9tYXApOwo+ICAgNzk2MCAgICAgICAg
ICB9Cj4gICA3OTYxCj4gICA3OTYyICAgICAgICAgIGNwdV9jbGtfbWFwID0gdDdfcmVnbWFwX3Jl
c291cmNlKGRldiwgImNwdV9jbGsiKTsKPiAgIDc5NjMgICAgICAgICAgaWYgKElTX0VSUihjcHVf
Y2xrX21hcCkpIHsKPiAgIDc5NjQgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImNwdSBj
bGsgcmVnaXN0ZXJzIG5vdCBmb3VuZFxuIik7Cj4gICA3OTY1ICAgICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoY3B1X2Nsa19tYXApOwo+ICAgNzk2NiAgICAgICAgICB9Cj4gICA3OTY3Cj4g
ICA3OTY4ICAgICAgICAgIC8qIFBvcHVsYXRlIHJlZ21hcCBmb3IgdGhlIHJlZ21hcCBiYWNrZWQg
Y2xvY2tzICovCj4gICA3OTY5ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHQ3
X2Nsa19yZWdtYXBzKTsgaSsrKQo+ICAgNzk3MCAgICAgICAgICAgICAgICAgIHQ3X2Nsa19yZWdt
YXBzW2ldLT5tYXAgPSBiYXNpY19tYXA7Cj4gICA3OTcxCj4gICA3OTcyICAgICAgICAgIGZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKHQ3X2NwdV9jbGtfcmVnbWFwcyk7IGkrKykKPiAgIDc5NzMg
ICAgICAgICAgICAgICAgICB0N19jcHVfY2xrX3JlZ21hcHNbaV0tPm1hcCA9IGNwdV9jbGtfbWFw
Owo+ICAgNzk3NAo+ICAgNzk3NSAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRSh0
N19wbGxfY2xrX3JlZ21hcHMpOyBpKyspCj4gICA3OTc2ICAgICAgICAgICAgICAgICAgdDdfcGxs
X2Nsa19yZWdtYXBzW2ldLT5tYXAgPSBwbGxfbWFwOwo+ICAgNzk3NyAgICAgICAgICByZWdtYXBf
d3JpdGUocGxsX21hcCwgQU5BQ1RSTF9NUExMX0NUUkwwLCAweDAwMDAwNTQzKTsKPiAgIDc5NzgK
PiAgIDc5NzkgICAgICAgICAgbWNsa19kYXRhID0gdDdfbWNsa19wbGxfZGNvLmRhdGE7Cj4gICA3
OTgwCj4gICA3OTgxICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCB0N19od19vbmVjZWxsX2RhdGEu
bnVtOyBpKyspIHsKPiAgIDc5ODIgICAgICAgICAgICAgICAgICAvKiBhcnJheSBtaWdodCBiZSBz
cGFyc2UgKi8KPiAgIDc5ODMgICAgICAgICAgICAgICAgICBpZiAoIXQ3X2h3X29uZWNlbGxfZGF0
YS5od3NbaV0pCj4gICA3OTg0ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiAg
IDc5ODUKPiAgIDc5ODYgICAgICAgICAgICAgICAgICByZXQgPSBkZXZtX2Nsa19od19yZWdpc3Rl
cihkZXYsIHQ3X2h3X29uZWNlbGxfZGF0YS5od3NbaV0pOwo+ICAgNzk4NyAgICAgICAgICAgICAg
ICAgIGlmIChyZXQpIHsKPiAgIDc5ODggICAgICAgICAgICAgICAgICAgICAgICAgIGRldl9lcnIo
ZGV2LCAiQ2xvY2sgcmVnaXN0cmF0aW9uIGZhaWxlZFxuIik7Cj4gICA3OTg5ICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICAgNzk5MCAgICAgICAgICAgICAgICAgIH0KPiAg
IDc5OTEgICAgICAgICAgfQo+ICAgNzk5MiAgICAgICAgICBtZXNvbl90N19kdmZzX3NldHVwKHBk
ZXYpOwo+ICAgNzk5Mwo+ICAgNzk5NAo+ICAgNzk5NSAgICAgICAgICByZXR1cm4gZGV2bV9vZl9j
bGtfYWRkX2h3X3Byb3ZpZGVyKGRldiwgb2ZfY2xrX2h3X29uZWNlbGxfZ2V0LCAmdDdfaHdfb25l
Y2VsbF9kYXRhKTsKPiAgIDc5OTYgIH0KPiAgIDc5OTcKPgo+IC0tCj4gMC1EQVkgQ0kgS2VybmVs
IFRlc3QgU2VydmljZQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9sa3AtdGVzdHMvd2lraQoK
SSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBhbmQgdXNlIHRoZSBTNCBjbG9jayBkcml2ZXIgYWZ0ZXIg
aXQgbGFuZHMuClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
