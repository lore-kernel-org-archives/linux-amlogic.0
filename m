Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B911E77188
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jan 2025 04:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:To:References:
	Date:Subject:Mime-Version:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTHf1xcoZJLs8wgiHiXnI3ZtqnacbFxeSH0I9grAnO4=; b=22yzwW1SR6+Kb8
	kD+QpmHawBmlWoaJ1ySqDUkfnGzlgsg5hcHs69KAZPARNVLkzH7I1Nc6KSgMMAO3x1aiTJo/2GASr
	7bmsMLinS7m07QK8d5thDmZdddbg0pvF44vd2FjyREAZ3KGS3S5zPyYE5iEeWGk/ikoT1NZsjlmQr
	YuXX4iZSgHMPE9cbDp9adrKoL29RAT+X3pRYG1DEdnn1RPY2lbiuHe41mv26CJVbMocL+nBz8CWKO
	97bDU7xVdXBckX/cyE4j9wB2lWjFUBKxghPfXTbKMoQnRbe53/w/AInGPxNncG2mZmxJkmXHfPJEO
	V4dAj65gIc8gzNvpF9vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Nu-0000000DxXc-3UTI;
	Fri, 10 Jan 2025 04:12:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW6Ns-0000000DxXB-19la
	for linux-amlogic@lists.infradead.org;
	Fri, 10 Jan 2025 04:12:33 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so819088f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Jan 2025 20:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736482350; x=1737087150; darn=lists.infradead.org;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcg+AbNUagdr/GnXOyARNpX3VNRzL5mr6RLcmdmpWq4=;
        b=ZaEjFHsDbr2yk0MEs61hNVSI0v10YDUx6GdXQHnopVVZ14X7DU/Q82051bBCrQs/ZI
         UW14LuDLi9D7eI7Gi8rU94wGYVgYe7qZtnbi9vNYW8F7Ti7B46ZgPuds5yxxGJa/WKFF
         k9wbPaPS1H53FWYg1ligAbedMftrolQDk6dfQMNAUbYExYqqrm2rKrDCcV0rv/eBiAms
         BhS96PlxVybeEWEBNmaIwVfHU0dLQnteH1RYU+LD05ZZXApN2ycAh6eifsnsVIvVSbrL
         WqcJx3eHFwLjY/bWgOHAv02QsGWcvTOF+vP+fADcQjOYuuyn7BjIc4RWqvxknpR4bzSz
         SGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736482350; x=1737087150;
        h=message-id:in-reply-to:to:references:date:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcg+AbNUagdr/GnXOyARNpX3VNRzL5mr6RLcmdmpWq4=;
        b=QlyZ4MOF3VKgovqV+YcW2ViKxfElvCesXc9HafesZ7+iZRZ72T0xbGN3xDIKQL4OrN
         q93fUk6MWpYQKb9m95nQISFg1KIeqPx42NBJMiu4XcafdHG7dGotL/PnYD8p+4O90GKP
         Oc1OadVJ1bIdirIf2fKda54QXDGHu1Ac+F+8PLQz0lH+xO1rNlBXQU3gXeNPDsvtzuhZ
         Nq7OTGyooQjtIX5Ly2efqFcb1H5JCNFuuYzeOax9ChfWfW8i758ij0HUIOetPgpbgNug
         uM6L8D3F9SM5g01ild4CC88Rv6e9r/tUi3GE3/3t60+BUk6Wwv7HTvYX3h0znxZVfypN
         87JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPWfhYpPIQnnU44xC0fBRDbdxkY6ZG3D4ZxgzptYpWv+HtN/q+HHrbfe4RoX88VjBfS7/ykEul7Bc2azxr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5lZjbEW3CSgB/sGhcywClvgjbF1Cb5Q/jtLq1TDaRqHKsQe24
	6Pyvit+JY+jByaL/oCoGDoA8cm5PgN5DnycUXfmsEZdfk9GQxJ/Y
X-Gm-Gg: ASbGnctORHEFWOl8Gn+RZezJZLfMtgOzCoslyzqDIz4FVgBGlNyMsTtXyOrgKDuZeLh
	8pHqh9dvvsL+muLanXIILy6ZjDC5hZUYuvRH6W905NiNuojOJYra8/6/DPNXYYZ7TSH1RRAJ1Zp
	tZLOhf0OII6fuCpagb/2jsQ55FBEC7FljZHP88wInJRfm/F8xLN5jiXv0XYJsx/wYmNmvEGswzE
	C60eHbqd/4kYW8IO9y0VrJFnrEgznOnRjNIkR5DKdbn4zj6cqU6yYkO8RJVJF5Panr0t7Ch+CXZ
	0fI=
X-Google-Smtp-Source: AGHT+IGbDMIld2lAh5kd8KV7ln8byuZOqPwrIxJ4sixY28HelypxvHQugYQ+DIZdYNNqD3wjEoTaLQ==
X-Received: by 2002:a05:6000:1fa1:b0:388:caf4:e909 with SMTP id ffacd0b85a97d-38a872e8bc4mr8994719f8f.25.1736482350274;
        Thu, 09 Jan 2025 20:12:30 -0800 (PST)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c697sm3429114f8f.52.2025.01.09.20.12.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jan 2025 20:12:29 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] board: amlogic: odroid-n2: remove amlogic prefix from
 fdtdir path
Date: Fri, 10 Jan 2025 08:12:17 +0400
References: <20250110040353.3424412-1-christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Tom Rini <trini@konsulko.com>,
 u-boot@lists.denx.de,
 u-boot-amlogic@groups.io,
 linux-amlogic@lists.infradead.org
In-Reply-To: <20250110040353.3424412-1-christianshewitt@gmail.com>
Message-Id: <CC4AC28B-2FB2-4AE0-B4CB-8FCA84D8A6C2@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_201232_314016_C88F50B4 
X-CRM114-Status: UNSURE (   9.63  )
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

PiBPbiAxMCBKYW4gMjAyNSwgYXQgODowM+KAr2FtLCBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3Rp
YW5zaGV3aXR0QGdtYWlsLmNvbT4gd3JvdGU6Cj4gCj4gQ29tbWl0IDgzNGU3YzgxMzZjNiAoImR0
czogbWVzb24tZzEyYTogU3dpdGNoIHRvIHVzaW5nIHVwc3RyZWFtIERUIikKPiBjaGFuZ2VkIEFt
bG9naWMgY29uZmlncyB0byBjb250YWluIHRoZSBkZWZhdWx0IC9hbWxvZ2ljIGRldmljZS10cmVl
Cj4gcGF0aCBwcmVmaXgsIGUuZy4gZm9yIG9kcm9pZC1uMjoKPiAKPiBDT05GSUdfREVGQVVMVF9E
RVZJQ0VfVFJFRT0iYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1uMiIKPiAKPiBUaGUgYm9hcmQg
ZmlsZXMgYWxzbyBwcmVmaXggYW1sb2dpYyB3aGVuIHVzaW5nIGZkdGRpciByZXN1bHRpbmcgaW4K
PiBhbiAvYW1sb2dpYy9hbWxvZ2ljL21lc29uLWcxMmItb2Ryb2lkLW4yLmR0YiBwYXRoIHdoaWNo
IGlzIGludmFsaWQKPiB3aXRoIG1vc3QgZGlzdHJvIHBhY2thZ2luZy4gRHJvcCB0aGUgcHJlZml4
IGhlcmUgdG8gYWxpZ24gd2l0aCB0aGUKPiBib2FyZCBjb25maWdzLiBUaGlzIHJlc29sdmVzIGZk
dGRpciBib290IG9uIE9kcm9pZCBOMi9DNC9IQzQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+CgpQbGVhc2UgZGlzcmVnYXJk
IHRoaXMgcGF0Y2guIEnigJl2ZSBzcG90dGVkIHRoZSBpc3N1ZSBpbiBvdXIgZGlzdHJvCnBhY2th
Z2luZyBhbmQgdGhpcyBpcyBub3QgcmVxdWlyZWQuIEFwb2xvZ2llcyBmb3IgdGhlIG5vaXNlLgoK
Q0guCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dp
Ywo=
