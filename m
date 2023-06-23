Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A999DC0015E
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/CRUo31GApT509nPSs9ehPFsAYFKhGco/bkndy8YZJk=; b=yeBSr/tY+e8ss9
	TGLDYnQLxjfNdkPgKSqU8urPWAnNKUUd/C7cAOim39z6u6hyYZmXdyYLMLvIwS8AbPOmTGyD1/cpl
	KbfcJjhk9MaAuvDs+y9GZ5M12jY4iZgYlCifSGtChpIK3WHjJ2fQMwDMOQXYvlW9K32kJLAwLRENz
	9o6BBrRmbaxBC3IY7JXoolhw1UabPIpNMSE3o9RtKHTFyrOwyVaFnAHjaRLXo103I/ojxUCFcBSW7
	FB7mjIpEYu1p+QOPIV8gqGpxZAg8Y89skOMJq1OHlvs6FC1zVeqldF2YB+kFdcNibMq3XC5hG4GPa
	m7AcFP01GZw7NdVA7bkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCkyu-004FHo-2y;
	Fri, 23 Jun 2023 17:54:00 +0000
Received: from mail-yb1-f178.google.com ([209.85.219.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCkys-004FFN-0X;
	Fri, 23 Jun 2023 17:53:59 +0000
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-bc40d4145feso742626276.1;
        Fri, 23 Jun 2023 10:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687542825; x=1690134825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mvsLdT639PCbMIODrmN1JmfHHDk3gCbxCBi4kyaJ9fk=;
        b=JWHwNNPJHWjmidnpf/tRlqgQOLCdrlZCO3xO++O/b7O9++ozn5Zwnu6F4jb/9uv+pQ
         /fkGJuEbnfslyacpQvt2LQU2lq0N41nD6r5KZzbUmkSxhXluMBkO2Qxt2fVgnEVecfPd
         NFruC6zcIqzmyhSNUNLWrbbWO3urIWaEZnbCOUrePp8KC6GjpWhrhffo/Dhu33xIFg+2
         ooGpjm1+j1BAh7O3/KwZ6ikvYE/lv+jgrVe7N5LvdCXM9+elL4dPLVdLFsvrvG5J1aPV
         1JjCHbDiuG3gmaCFTllelk1TWQCtvVsQwlFD12ELSvZAP+KlIJw3pP9WpFSYvKwVlXRA
         CwtQ==
X-Gm-Message-State: AC+VfDyMw6fXUh2J5TC01K6CDjVUgZ7f9JqXZ1acJaIu4M0Pxh08houZ
	a3nNOqx4IF99lOCfkc066842ufABTE0SdH6I
X-Google-Smtp-Source: ACHHUZ5Zxsv+GkuM7t5uwWiQK9A93bFlDDO2jugOQTbBTiwJFckwXrfmHCJl9cwZfZBFifSsrZWt1w==
X-Received: by 2002:a05:6902:18b:b0:bc6:c22f:581a with SMTP id t11-20020a056902018b00b00bc6c22f581amr17141281ybh.38.1687542824829;
        Fri, 23 Jun 2023 10:53:44 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id u64-20020a25c443000000b00be33d66ebbasm2149207ybf.44.2023.06.23.10.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 10:53:44 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-570114e1feaso8278867b3.3;
        Fri, 23 Jun 2023 10:53:43 -0700 (PDT)
X-Received: by 2002:a81:60d6:0:b0:570:7fcb:9506 with SMTP id
 u205-20020a8160d6000000b005707fcb9506mr21842972ywb.37.1687542823789; Fri, 23
 Jun 2023 10:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230623081242.109131-1-tanure@linux.com> <20230623081242.109131-3-tanure@linux.com>
 <a885b97e-aaf0-cb72-f25b-71054d6d3fe2@linaro.org>
In-Reply-To: <a885b97e-aaf0-cb72-f25b-71054d6d3fe2@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 23 Jun 2023 18:53:32 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+2qZg+RuwxmnM3rzs_akt_UMJRx+=aMxf72P-sGNjm9uw@mail.gmail.com>
Message-ID: <CAJX_Q+2qZg+RuwxmnM3rzs_akt_UMJRx+=aMxf72P-sGNjm9uw@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_105358_202880_1954BC4B 
X-CRM114-Status: GOOD (  20.23  )
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

T24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgOTo1MeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMy8wNi8yMDIzIDEw
OjEyLCBMdWNhcyBUYW51cmUgd3JvdGU6Cj4gPiBBbWxvZ2ljIFQ3IFNvQ3MgdXNlcyB0aGUgc2Ft
ZSBVQVJUIGNvbnRyb2xsZXIgYXMgUzQgU29DcyBhbmQgRzEyQS4KPiA+IFRoZXJlIGlzIG5vIG5l
ZWQgZm9yIGFuIGV4dHJhIGNvbXBhdGlibGUgbGluZSBpbiB0aGUgZHJpdmVyLCBidXQKPiA+IGFk
ZCBUNyBjb21wYXRpYmxlIGxpbmUgZm9yIGRvY3VtZW50YXRpb24uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogTHVjYXMgVGFudXJlIDx0YW51cmVAbGludXguY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sICAgICAgICB8
IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2lj
LG1lc29uLXVhcnQueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
YWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiA+IGluZGV4IDAxZWM0NWIzYjQwNi4uYWQ5NzBj
OWVkMWM3IDEwMDY0NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3NlcmlhbC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+ID4gQEAg
LTUwLDYgKzUwLDEwIEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICBpdGVtczoKPiA+ICAgICAg
ICAgICAgLSBjb25zdDogYW1sb2dpYyxtZXNvbi1nMTJhLXVhcnQKPiA+ICAgICAgICAgICAgLSBj
b25zdDogYW1sb2dpYyxtZXNvbi1neC11YXJ0Cj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogVUFS
VCBjb250cm9sbGVyIG9uIFQ3IGNvbXBhdGlibGUgU29Dcwo+Cj4gWW91ciBkZXNjcmlwdGlvbiBp
cyByYXRoZXIgaW5jb3JyZWN0LiBUaGlzIGlzIFVBUlQgb24gU29DcyBjb21wYXRpYmxlCj4gd2l0
aCBTNCwgbm90IHdpdGggVDcuIE90aGVyd2lzZSB3aGF0IGRvIHlvdSBleHBlY3QgdG8gZ3JvdyBs
YXRlciB3aGVuCj4gYWRkaW5nIG1vcmUgY29tcGF0aWJsZSBkZXZpY2VzPyBKdXN0IGRyb3AgdGhl
IGRlc2NyaXB0aW9uLCBpdCdzIGtpbmQgb2YKPiBvYnZpb3VzIHdoZW4gZG9uZSBjb3JyZWN0bHkg
KGJ1dCBjYW4gYmUgbWlzbGVhZGluZyBpZiBkb25lIHdyb25nKS4KPgo+IEFja2VkLWJ5OiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4KU29ycnks
IGJ1dCBTNCBpcyBhbHJlYWR5IGFkZGVkIGluIGFub3RoZXIgd2F5LCB3aGljaCBhY2NlcHRzIGp1
c3QgYW4KUzQgY29tcGF0aWJsZSBzdHJpbmcuCkJ1dCBmb3IgVDcgd2UgbmVlZCBhIGZhbGxiYWNr
LgpDb3VsZCB5b3UgbGV0IG1lIGtub3cgd2hhdCB5b3UncmUgYXNraW5nIGhlcmU/IFJlZG8gUzQg
YW5kIGFkZCBUNz8gT3IKZG8gVDcgaW4gYW5vdGhlciBkaWZmZXJlbnQgd2F5IHRoYXQgSSBkaWRu
J3QgZ2V0PwpEbyB5b3Ugd2FudCBhIHY2IHBhdGNoIHNlcmllcz8gSWYgeWVzLCBjb3VsZCB5b3Ug
YmUgbW9yZSBjbGVhciBhYm91dApob3cgeW91IHdhbnQgaXQ/Cgo+Cj4gQmVzdCByZWdhcmRzLAo+
IEtyenlzenRvZgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
