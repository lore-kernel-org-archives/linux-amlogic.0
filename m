Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77759C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 15:25:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08FC60FE4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 15:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08FC60FE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:References:In-Reply-To:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8O5KQng5ImcFLHr9OPdDOySbFmj5yyVkuvaqgOGCIM=; b=dksMV47Cwaydy1yk/2VTz6YTOF
	OFqnIEm8pa1MxRrrdk4cTNsWbh1cb+GFIfaQOg8zVOqP9TwzfqHbhE0IDnXBzhJt8lLl5u0zSKBTE
	j3p0ZjTcoG2qQFAzf1KLifnvFcr7uYEe5a/+EDQkYjlqPyKucwmjEDI+bMFzgq5maqQ4P4Y7H+52t
	6UcCFpX5TuTn4UxLF5iUi07dHiy+yQhjLThdW9sBaRRPqF3Dg6OS8hDRkdQW/DyyZquIThcc5RGxm
	rB1wCurx35rHVDU+fd1gez2UnGpHyKtisCL0u5PfwxrAHc8OElSSDhPLdkxrEK85E7FsQqbyr8JhD
	ZF1S0pDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcV11-0085Ru-9Q; Fri, 30 Apr 2021 15:25:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcV0o-0085Qp-0i; Fri, 30 Apr 2021 15:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-Id:Date:Subject:References:
 In-Reply-To:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=5FfXtxbf2+1RT69S9AA6R5xDes94gPxdY4zFREGjPU4=; b=svLsYXbGIJ3uYRFd5TSXXLXZ35
 fli65Jk1JEpdsAdD1Ozhe/e7vh9B/bx2QXRQ96lvfarNNH1Dg0/Y8+o7tnZVF9aIllbEAjioHnu5I
 AWpLEnQKYOQF9yZCQi/hALOHavSkaPyRUFxTT0tIZVzP5hkSgEH5sDbTi02lU3fJD31vsjT1SCdas
 6tiB252sACuDih0vNbwp9R1fNWaHQbSZXnFhVLaE0OaQS9dPdxaXLuU0LmEiERghU3oi3aqlpoEZU
 U7NDlc90tGWBnBFiIeF7JssPAAaWed/w/TW/APAq2SZhD3n3wYAC2QAet/bli9ecN/ThlnOhL1KKX
 3/Dty5ig==;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcV0l-001TsN-86; Fri, 30 Apr 2021 15:25:00 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso59953876otv.6; 
 Fri, 30 Apr 2021 08:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5FfXtxbf2+1RT69S9AA6R5xDes94gPxdY4zFREGjPU4=;
 b=pGKvv9oIbyAmxP9eTuqFA85QGb9iPoZVMkrdxsXO1xNOFuthJD6fH9NBPcTmseB4uw
 O5KMH+EQik/RO0J7uJFuvbS8b7pnB6e6U22NKtlZpZvwl7MT76R2xpZOUI5kHKw4k8XE
 k/1YfzrhCTPTzk4s1v7LdHH7RhbeK46/8gjmYBx5hqLjPfL0hPu+45BgHgH3CC9qr4DY
 Bw0QLimLP5oaMtONpHEnLOAxNEVpZ4vV0cPPZMz6yP9osqi5eaP6X2ChBGcJ7TpGzxI0
 PQ++3+zzGeUsSt3jQkigQwgRE0n9N9nDwnvtUK1Ccwa/YhxIIgzGqsTwp3f2Iv2eDteQ
 y8fQ==
X-Gm-Message-State: AOAM5316O0AnmuvzqedvUwj47cGNTZIwu4HAkNNJWco1ssWm0BLhTny5
 jMDs8l4+WNitEW/t0BBG9w==
X-Google-Smtp-Source: ABdhPJzl7TZAjS/JHU4Kn3ojk7o8O0fWkXJU/cjLK3k6oupxy5IcPcWakw/i3Ek1NYI6k+ruJyHyyw==
X-Received: by 2002:a05:6830:4111:: with SMTP id
 w17mr4111512ott.99.1619796297875; 
 Fri, 30 Apr 2021 08:24:57 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c7sm803077oot.42.2021.04.30.08.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:24:57 -0700 (PDT)
Received: (nullmailer pid 3353973 invoked by uid 1000);
 Fri, 30 Apr 2021 15:24:53 -0000
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-kernel@vger.kernel.org, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20210429170404.3616111-3-narmstrong@baylibre.com>
References: <20210429170404.3616111-1-narmstrong@baylibre.com>
 <20210429170404.3616111-3-narmstrong@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: add Banana PI M5 bindings
Date: Fri, 30 Apr 2021 10:24:53 -0500
Message-Id: <1619796293.730307.3353972.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_082459_307224_A72312AD 
X-CRM114-Status: GOOD (  11.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 29 Apr 2021 19:04:03 +0200, Neil Armstrong wrote:
> Add bindings for the Banana PI M5 board.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/amlogic.yaml:167:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/arm/amlogic.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 421, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 109, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 850, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 731, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 167, column 1
make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/arm/amlogic.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/arm/amlogic.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 167, column 1
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/amlogic.yaml: ignoring, error parsing file
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/amlogic.yaml
make: *** [Makefile:1414: dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1471788

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
