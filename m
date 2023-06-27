Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D6FEB64D9
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 08:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RdKFkF2G3pfpxl5GH8mPjYQIGMq7FYTBDQpKthi/DH4=; b=1NrYryPE4DwDEb
	b4DTwwIurmyBZUz3UkI8R7s8tsp4JEQc0JABXPCfsCoNPC5qNk0O77vFVqLNbnhBTdmdXVSWAzan/
	60joMslTb+yricNKhMlQFV/zywDaaqK0zRZW96erV3NeKW16NMX4mt4QSqr2r0Alo8VBN2jR+2msV
	N+kB9NZZ+BUx8q7Q0OpHr74mdf5/PKERYlJ3gKVgEpCkZfSXVAdyIJ5GMF5n6g3MtHeA4sDmH0XQl
	+qe4TLBwSQJkKGfCh795YUjsE+L5qaLEJm8YCG+HE6BtH81iDHO9nV7GOZGGUYbUSS+oxnKafAc1W
	qJudQSNBbgezuTLoYT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4VJ-00CctD-1b;
	Tue, 27 Jun 2023 08:56:53 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE4VF-00Ccrk-1w;
	Tue, 27 Jun 2023 08:56:51 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-98bcc533490so514390066b.0;
        Tue, 27 Jun 2023 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687856207; x=1690448207;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/PscuUk8Kiipv4zwt68FQ9jdpIXfbCLhmtQ6RSmb1A=;
        b=iklmi/RUx0AqL55xuQrCfcTnc9lvoc9TNRqdWsM8E26IhOJnF1afg9iIZ93oeLaejo
         h5w7WAn5XmSYKIHaM+v65tzVsnwT55KbQQI4pgQKIzAw8sY12JfvZWKudsYDjUaC63v1
         m8p3mqom3t3D4zqsEM7ig6KJUivP5rcC7iW/C4hz6iTYq2/Er9r7SADWvK7rgwgIX6qa
         REz/hubT3jLRmEh7+UJGN7uwxl5gXciwbQ5GvASN18YsweVqp3OHEut3Cx/gdWq42wFp
         DnN67773WZN51M5eDCaU3G6g0/dnwRpEROsRVVumu14CU89rMa1+xVCUlsWU7H6J4e38
         VezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687856207; x=1690448207;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/PscuUk8Kiipv4zwt68FQ9jdpIXfbCLhmtQ6RSmb1A=;
        b=YLuHHbizIA2gGDDasut4TrJrzrVNOa3Vth7Q1uhOUEu/aJHcSqGT7iYaYLfNDcCuZ+
         oN1AtSX3p3ONiausbc1u5RBuIRKw2H6/SZEbjFI4nAUxDwv+OpSkSB9nsJ31fvTa6m1F
         2o/KgkQux9X5OUsOC5pQWpJKfDOfOr9+sjufclPnAH0gkVJSq2NClqLF/WQGzx6Zw++1
         UhvVhdUUzemos+28Fo1+ZCKa1G86Gd77kkzlr2N4HKtvARBCaMrXWKbbqsKbCTXCsNGb
         GCpdkkd2bzGXEcLR6rdKvhdxs5PqRYCzNRakqNtQCAFCKwek2bUa2Z6S3E3kMwybtqXw
         eafQ==
X-Gm-Message-State: AC+VfDyac0tWfpzofeSl6DuyK01SDC7gjWiY3ys1TnttG/0HFQivb64p
	tUGTDipGKjXKg+dDFfMLhbQOMj9jCWy6ug==
X-Google-Smtp-Source: ACHHUZ4OMI9GAwQY/y/YttSFuhosd46Q7vuSFOlipsYh3eBXwzYf5FC1OFX4yp7wvL8e5HDNKyQFVA==
X-Received: by 2002:a17:906:eecd:b0:988:6491:98db with SMTP id wu13-20020a170906eecd00b00988649198dbmr20618073ejb.17.1687856206786;
        Tue, 27 Jun 2023 01:56:46 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id t13-20020a170906178d00b0098951bb4dc3sm4221891eje.184.2023.06.27.01.56.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Jun 2023 01:56:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add T7 based AN400
 bindings
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230626095223.721011-2-xianwei.zhao@amlogic.com>
Date: Tue, 27 Jun 2023 12:56:42 +0400
Cc: linux-arm-kernel@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>,
 AML <linux-amlogic@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Message-Id: <94551B90-19E8-49C7-90FC-FAFA5E5E2D9C@gmail.com>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-2-xianwei.zhao@amlogic.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_015649_638186_07E27F8F 
X-CRM114-Status: GOOD (  18.02  )
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

PiBPbiAyNiBKdW4gMjAyMywgYXQgMTo1MiBwbSwgWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9A
YW1sb2dpYy5jb20+IHdyb3RlOgo+IAo+IERvY3VtZW50IHRoZSBuZXcgVDcgU29DL2JvYXJkIGRl
dmljZSB0cmVlIGJpbmRpbmdzLgo+IAo+IFQ3IGlzIGFuIGFkdmFuY2VkIGFwcGxpY2F0aW9uIHBy
b2Nlc3NvciBkZXNpZ25lZCBmb3Igc21hcnQgZGlzcGxheS4KPiBJdCBpbnRlZ3JhdGVzIGEgcG93
ZXJmdWwgQ1BVL0dQVSBzdWJzeXN0ZW0sIGEgc2VjdXJlZCA4SyB2aWRlbwo+IENPREVDIGVuZ2lu
ZSB3aXRoIGFsbCBtYWpvciBwZXJpcGhlcmFscy4KCl4gcGxlYXNlIGF2b2lkIG1hcmtldGluZyB0
ZXh0IGluIGNvbW1pdCBtZXNzYWdlcyAoYW5kIHNhbWUgZm9yIHRoZQpvdGhlciBjb21taXRzIGlu
IHRoaXMgc2VyaWVzKS4KCj4gVGhlIG1haW4gc3lzdGVtIENQVSBpcyBiYXNlZCBvbiBCaWcuTElU
VExFIGFyY2hpdGVjdHVyZSwKPiB3aXRoIHF1YWQgY29yZSBDb3J0ZXgtQTczIGNsdXN0ZXIgYW5k
IHF1YWQgY29yZSBDb3J0ZXgtQTUzIGNsdXN0ZXIuCgrigJxUNyBpcyBhbiBBbWxvZ2ljIFNvQyBm
b3Igc21hcnQgZGlzcGxheSBhcHBsaWNhdGlvbnMuIFRoZSBtYWluIENQVSBpcwpiYXNlZCBvbiBh
IGJpZy5MSVRUTEUgYXJjaGl0ZWN0dXJlIHdpdGggYSBxdWFkLWNvcmUgQTczIGNsdXN0ZXIgYW5k
CnF1YWQtY29yZSBBNTMgY2x1c3Rlci7igJ0KCkNocmlzdGlhbgoKPiBTaWduZWQtb2ZmLWJ5OiBY
aWFud2VpIFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiAtLS0KPiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCB8IDYgKysrKysrCj4gMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55YW1sCj4gaW5kZXggMDhkNTk4NDI2NTVj
Li43OWE4YjQ0ZmZkMDMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAo+IEBAIC0yMTgsNiArMjE4LDEyIEBAIHByb3BlcnRp
ZXM6Cj4gICAgICAgICAgICAgICAtIGFtbG9naWMsYXEyMjIKPiAgICAgICAgICAgLSBjb25zdDog
YW1sb2dpYyxzNAo+IAo+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBCb2FyZHMgd2l0aCB0aGUgQW1s
b2dpYyBUNyBBMzExRDIgU29DCj4gKyAgICAgICAgaXRlbXM6Cj4gKyAgICAgICAgICAtIGVudW06
Cj4gKyAgICAgICAgICAgICAgLSBhbWxvZ2ljLGFuNDAwCj4gKyAgICAgICAgICAtIGNvbnN0OiBh
bWxvZ2ljLHQ3Cj4gKwo+IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gCj4gLi4uCj4gLS0g
Cj4gMi4zNy4xCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWFtbG9naWMK
