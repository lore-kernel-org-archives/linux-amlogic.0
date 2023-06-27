Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB91EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uTDSNOWLLh8TeVygHFE6lcp8MpBhUTUK1wvfv2T4LtA=; b=4R7Y9hW3aGrduXxKgqh6sYsZiW
	4+P9skkVQ9Tnd//fsBsAFdZFjmGoRc5XTlioKuQ9cuS5BCALSIueum7lNm3aDIYiLCxxXik0bc3SK
	psOiaC0dYP6ddj+sJ1CrZcJI73jerxS3X+rRkPfbxbHjqIAtH0FEai9uuFd3lWtgiFxQbckHREOoz
	rVsy61Kpi3HmZ90rgTNrtB2ohtnrv4h+BqEB/+aIr57h/2oQms30Tz5vTzsl528UugtDXxM8IBTHo
	SpdaySdO8+UEHtgKZm9JfSk4IWSqDYZ0+TUPZ3SSdOGxHGRdBpnpxirzITJRmBzRCrhgiA4Ybs1Zd
	pXx2NThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3Mt-00CPkG-2j;
	Tue, 27 Jun 2023 07:44:07 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3Mp-00CPeo-2F
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jun 2023 07:44:05 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso3877867e87.1
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jun 2023 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687851832; x=1690443832;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Qht7SqGLbmJWzU5hnUhM0fN/sQoDQZIYVELEYjld22w=;
        b=ToU64NKGbR4QsZRo9+hl4zbyIbkqlm7DReyCHhFgL6QpyVntnjtwP+8681XRrbNByJ
         Tnlmtdc0sS2X5sXKrCNiWs+0evI34zlGixJt9aDKFnmXlWEi0BLwQHe+A2G8fHOfX/o8
         5pZO51cwl4mSF3WHn9PP4g8dmohFVEOqi/vhYXrKq08L07DDtvZqRR/ATFxZ3y2uY59k
         dQ+CpkM+GiIlZdt/pXvSPoQFCXh0p1+Vdyd7eyVDCtwSdywhXcZO0E2S32oDvv/RVxXU
         CXdsBWSg9SU0eaLHXRRU1YMZHDPZ7OdIUJaPvjucib/4zlshCNkbG0c8Dv9MZxHina1j
         xnMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687851832; x=1690443832;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qht7SqGLbmJWzU5hnUhM0fN/sQoDQZIYVELEYjld22w=;
        b=O5Vo7OCBJu6y13hHkyq3coAb1VclDl39gncIkd22qzkYzETVLzTY2cJw9RBRTgSQki
         T+7wr9PaUuLbGzInIXJWCGU3Heh1K9TcWgmaxWTmdxFxbCPYhqUuPhWRQlqNpRC4yt0N
         Dbask9yG0zxzs5J8HVZCnwWKczPilsjPvNfcGqbBjZCL5RjDwIcL9VpnmspHDfUlPJ4O
         OhvWFDeoAhROyeXphTaZHVTctw1Kf7tGuSBFyxxvIg87OwTNMcQkkDLxxTjZHrm+VVko
         blylS1Pm5XgQm23IKhJlEeozLmVLW7caTb8VTrO78sgEiVZJXD7a1BVQ/sGayArGKLK/
         3EtA==
X-Gm-Message-State: AC+VfDxV6hIhQzu1WXYbNjm6+eQo3qkHclcfqkDkKBXbWf92f1GoHvld
	WmosVi0lQFukv/XeYfbMsrbF/w==
X-Google-Smtp-Source: ACHHUZ4kfY2DPQ+asW4P38+Dgd5ePOe+T6M/G2eRs9P+TOc/20kSiDtl9r+C7hrsfXlu57oG2I4QeQ==
X-Received: by 2002:a05:6512:1142:b0:4fa:5255:4fa3 with SMTP id m2-20020a056512114200b004fa52554fa3mr3830323lfg.5.1687851832503;
        Tue, 27 Jun 2023 00:43:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:cec9:2929:7a19:7afa? ([2a01:e0a:982:cbb0:cec9:2929:7a19:7afa])
        by smtp.gmail.com with ESMTPSA id 13-20020a05600c240d00b003f7f2a1484csm9835606wmp.5.2023.06.27.00.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 00:43:52 -0700 (PDT)
Message-ID: <709fbed2-a7cf-d2fa-da4e-5d417b7130d4@linaro.org>
Date: Tue, 27 Jun 2023 09:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/2] Baisc devicetree support for Amlogic T7
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lucas Tanure <tanure@linux.com>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626-viewless-marrow-17838c2172f6@wendy>
 <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <676db602-54d8-d6b0-274f-365e65a2102c@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_004403_733328_2C75FFF0 
X-CRM114-Status: GOOD (  23.38  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjcvMDYvMjAyMyAwODoxMywgWGlhbndlaSBaaGFvIHdyb3RlOgo+IEhpIENvbm9yLAo+ICDC
oMKgwqAgVGhhbmtzIGZvciB5b3UgcmVwbHkuCj4gT24gMjAyMy82LzI2IDE4OjAyLCBDb25vciBE
b29sZXkgd3JvdGU6Cj4gCj4gCj4gID4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gID4KPiAgPiBIZXks
Cj4gID4KPiAgPiBPbiBNb24sIEp1biAyNiwgMjAyMyBhdCAwNTo1MjoyMVBNICswODAwLCBYaWFu
d2VpIFpoYW8gd3JvdGU6Cj4gID4+IFQ3IGlzIGFuIGFkdmFuY2VkIGFwcGxpY2F0aW9uIHByb2Nl
c3NvciBkZXNpZ25lZCBmb3Igc21hcnQgZGlzcGxheS4KPiAgPj4KPiAgPj4gQWRkIHRoZSBuZXcg
VDcgU29DL2JvYXJkIGRldmljZSB0cmVlIGJpbmRpbmdzLgo+ICA+Pgo+ICA+PiBBZGQgYmFzaWMg
c3VwcG9ydCBmb3IgdGhlIFQ3IGJhc2VkIEFtbG9naWMgQU40MDAgYm9hcmQsIHdoaWNoIGRlc2Ny
aWJlcwo+ICA+PiB0aGUgZm9sbG93aW5nIGNvbXBvbmVudHM6IENQVSwgR0lDLCBJUlEsIFRpbWVy
LCBVQVJULiBJdCdzIGNhcGFibGUgb2YKPiAgPj4gYm9vdGluZyB1cCBpbnRvIHRoZSBzZXJpYWwg
Y29uc29sZS4KPiAgPgo+ICA+IEx1Y2FzIGhhcyBhbHJlYWR5IHNlbnQgcGF0Y2hlcyBmb3IgdGhl
IFQ3IFNvQyAmIGlzIGF0IHY1Ogo+ICA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWRl
dmljZXRyZWUvMjAyMzA2MjMwODEyNDIuMTA5MTMxLTEtdGFudXJlQGxpbnV4LmNvbS8KPiAgPgo+
ICA+IFRoZXJlJ3MgYmVlbiBhIGJpdCBvZiBkaXNjdXNzaW9uIHRoZXJlLCBhbmQgdGhlcmUgc2Vy
aWFsIHN0dWZmIGluCj4gID4gcGFydGljdWxhciBpcyBkaWZmZXJlbnQgaW4gaGlzIHNlcmllcyAo
aXQgZG9lc24ndCB1c2UgYWx3YXlzLW9uIGZvcgo+ICA+IGV4YW1wbGVzKS4KPiAgPiBDb3VsZCB5
b3UgcGxlYXNlIGdvIGFuZCB0YWtlIGEgbG9vayBhdCBoaXMgc2VyaWVzPwo+ICA+Cj4gID4gQ2hl
ZXJzLAo+ICA+IENvbm9yLgo+ICA+Cj4gQU40MDAgaXMgdGhlIHJlZmVyZW5jZSBib2FyZCBkZXNp
Z25lZCBieSBBbWxvZ2ljLCB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSBLaGFkYXMgVklNNC4KClBs
ZWFzZSBjb29yZGluYXRlIHdpdGggTHVjYXMgc28gYSBzaW5nbGUgYmluZGluZ3MgJiBkdHNpIHBh
dGNoZXMgYXJlIHN1Ym1pdHRlZCwKaW4gYW55IGNhc2Ugb25seSBhIHNpbmdsZSBvbmUgd2lsbCBi
ZSByZXZpZXdlZCBhbmQgbWVyZ2VkLgpZb3UgY2FuIHJlYmFzZSB5b3VyIEFONDAwIGR0cyBvbiB0
b3Agb2YgaGlzIFZJTTQgaW5pdGlhbCBwYXRjaHNldC4KClRoYW5rcywKTmVpbAoKPiBBbmQgVDcg
c2VyaWFsIGlzIHRoZSBzYW1lIGFzIFM0LCBzbyBJIGZvbGxvdyBTNCBzZXJpYWwuCj4gCj4gID4+
Cj4gID4+IFhpYW53ZWkgWmhhbyAoMik6Cj4gID4+wqDCoMKgIGR0LWJpbmRpbmdzOiBhcm06IGFt
bG9naWM6IGFkZCBUNyBiYXNlZCBBTjQwMCBiaW5kaW5ncwo+ICA+PsKgwqDCoCBhcm02NDogZHRz
OiBhZGQgc3VwcG9ydCBmb3IgVDcgYmFzZWQgQW1sb2dpYyBBTjQwMAo+ICA+Pgo+ICA+PsKgwqAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbMKgwqDCoMKgwqAgfMKgwqAg
NiArCj4gID4+wqDCoCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvTWFrZWZpbGXCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gID4+wqDCoCAuLi4vZHRzL2FtbG9naWMvYW1sb2dpYy10
Ny1hMzExZDItYW40MDAuZHRzwqDCoCB8wqAgMzAgKysrKwo+ICA+PsKgwqAgYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL2FtbG9naWMtdDcuZHRzacKgwqAgfCAxNTYgKysrKysrKysrKysrKysr
KysrCj4gID4+wqDCoCA0IGZpbGVzIGNoYW5nZWQsIDE5MyBpbnNlcnRpb25zKCspCj4gID4+IGNy
ZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy10Ny1h
MzExZDItYW40MDAuZHRzCj4gID4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3Qv
ZHRzL2FtbG9naWMvYW1sb2dpYy10Ny5kdHNpCj4gID4+Cj4gID4+Cj4gID4+IGJhc2UtY29tbWl0
OiAwNTc4ODljYjQyNDQwOTZlYTVhYmNiZTc2ZmZkNGQzMTFjMzA3OGZlCj4gID4+IC0tCj4gID4+
IDIuMzcuMQo+ICA+Pgo+ICA+Pgo+ICA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ICA+PiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAo+ICA+PiBs
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAgPj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
